import SiwftUI

struct ListeManagers: View {
    @StateObject private var viewModel = ManagerViewModel()
    @State private var showCreateManager = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Liste des managers")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Button("Créer un nouveau manager") {
                    showCreateManager.toggle()
                }
                .buttonStyle(GreenButtonStyle())
                
                List(viewModel.managers) { manager in
                    ManagerCard(manager: manager)
                }
                .onAppear {
                    Task {
                        await viewModel.fetchManagers()
                    }
                }
            }
            .sheet(isPresented: $showCreateManager) {
                CreateManagerView(viewModel: viewModel)
            }
        }
    }
    
}

struct ListeManagersView_Previews: PreviewProvider {
    static var previews: some View {
        ListeManagersView()
    }
}