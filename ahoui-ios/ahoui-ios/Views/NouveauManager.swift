import SwiftUI

struct NouveauManager: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    @State private var isAdmin: Bool = false
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Image(systemName: "line.horizontal.3")
                    .font(.title)
                    .padding()
                Spacer()
                Text("AH OUI")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                Spacer()
                Image(systemName: "leaf.fill")
                    .foregroundColor(.green)
                    .padding()
            }
            .background(Color(red: 1, green: 0.965, blue: 0.922))
            
            Text("Nouveau manager")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Spacer()
            
            VStack(spacing: 15) {
                CustomTextField(title: "Nom", text: $name)
                CustomTextField(title: "Email", text: $email)
                CustomTextField(title: "Numéro de téléphone", text: $phone)
                CustomTextField(title: "Adresse", text: $address)
                
                Toggle("Admin ?", isOn: $isAdmin)
                    .padding(.horizontal)
            }
            .padding()
            .background(Color.white.opacity(0.5))
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
            .padding(.horizontal)
            
            Button("Créer") {}
                .buttonStyle(CreateButtonStyle())
                .padding(.top, 20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 1, green: 0.965, blue: 0.922).edgesIgnoringSafeArea(.all))
    }
}

// Custom Text Field
struct CustomTextField: View {
    var title: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .foregroundColor(.black)
            TextField("Entrez \(title.lowercased())", text: $text)
                .padding(10)
                .background(Color.white.opacity(0.5))
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
        }
    }
}

// Create Button Style
struct CreateButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 120, height: 40)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
            .foregroundColor(.black)
    }
}

struct NouveauManager_Previews: PreviewProvider {
    static var previews: some View {
        NouveauManager()
    }
}
