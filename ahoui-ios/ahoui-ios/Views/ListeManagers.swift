import SwiftUI

struct ListeManagers: View {
    var body: some View {
        VStack {
            // Header to be replaced by navbar
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
            
            Text("Liste des managers")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 10)
            
            Button("Créer un nouveau manager") {}
                .buttonStyle(GreenButtonStyle())
                .padding(.top, 10)
            
            SearchBar()
                .padding(.horizontal)
            
            ScrollView {
                VStack(spacing: 10) {
                    ManagerCard()
                    ManagerCard()
                    ManagerCard()
                }
            }
            .padding()
        }
        .background(Color(red: 1, green: 0.965, blue: 0.922).edgesIgnoringSafeArea(.all))
    }
}

// Custom Button Style
struct GreenButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 200, height: 40)
            .background(Color.green.opacity(0.2))
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.green, lineWidth: 1))
            .foregroundColor(.green)
    }
}

// Search Bar
struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            TextField("Rechercher un manager", text: $searchText)
                .padding(10)
                .background(Color.white.opacity(0.5))
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 0.5))
            Image(systemName: "magnifyingglass")
                .padding(.horizontal, 10)
        }
    }
}

// Manager Card
struct ManagerCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("John Doe")
                .font(.headline)
                .fontWeight(.bold)
            
            Text("Email : johndoe@example.com")
                .font(.caption)
                .foregroundColor(.gray)
            
            Text("Téléphone : 123-456-7890")
                .font(.caption)
                .foregroundColor(.gray)
            
            Text("Adresse : 3 rue du Plomb, Jacou")
                .font(.caption)
                .foregroundColor(.gray)
            
            Text("Admin : Oui")
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                Spacer()
                Button("Éditer") {}
                    .buttonStyle(EditButtonStyle())
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.85))
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black.opacity(0.3), lineWidth: 1))
    }
}

// Edit Button Style
struct EditButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .frame(width: 80)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.green, lineWidth: 1))
            .foregroundColor(.green)
    }
}

struct ListeManagers_Previews: PreviewProvider {
    static var previews: some View {
        ListeManagers()
    }
}

