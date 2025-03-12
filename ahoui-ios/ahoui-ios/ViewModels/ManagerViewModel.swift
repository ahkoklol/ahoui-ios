import Foundation

class ManagerViewModel: ObservableObject {
    @Published var managers: [Manager] = []
    
    private let baseURL = "https://yourapi.com/manager" // Replace with actual API URL
    private let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MjRkZGQ2MzVlNzZiMmU1OTUzZjk0NCIsImVtYWlsIjoic2FyYWhAZ21haWwuY29tIiwiaWF0IjoxNzQxNzc1NDI3LCJleHAiOjE3NDE3Nzg0Mjd9.mRDEJjYX9YK4P52GZVt_8j705mxDyZDPfpuY_ufPuEU"
    
    func fetchManagers() async {
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
            
            let decodedManagers = try JSONDecoder().decode([Manager].self, from: data)
            DispatchQueue.main.async {
                self.managers = decodedManagers
            }
        } catch {
            print("Error fetching managers: \(error)")
        }
    }
    
    func createManager(_ manager: Manager) async {
        guard let url = URL(string: "\(baseURL)/create") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(manager)
            request.httpBody = jsonData
            
            let (_, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 {
                await fetchManagers()
            }
        } catch {
            print("Error creating manager: \(error)")
        }
    }
}