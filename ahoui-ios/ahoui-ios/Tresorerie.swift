import SwiftUI

struct Tresorerie: View {
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
            
            // Global Treasury Section
            VStack {
                Text("Trésorerie globale")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                Text("Chiffre d’affaire : €117.10")
                    .font(.headline)
                    .foregroundColor(.green)
            }
            .padding()
            
            // Filter Buttons
            HStack {
                Button("Toutes les sessions") {}
                    .buttonStyle(CustomButtonStyle())
                
                Button("Toutes les opérations") {}
                    .buttonStyle(CustomButtonStyle())
            }
            .padding(.horizontal)
            
            // Transactions List
            ScrollView {
                VStack(spacing: 10) {
                    TransactionCard(title: "Vente de jeu", amount: "5€", color: .green)
                    TransactionCard(title: "Frais de dépôt", amount: "2€", color: .blue)
                    TransactionCard(title: "Remboursement", amount: "-13€", color: .red)
                    TransactionCard(title: "Remboursement", amount: "-13€", color: .red)
                }
            }
            .padding()
        }
        .background(Color(red: 1, green: 0.965, blue: 0.922).edgesIgnoringSafeArea(.all))
    }
}

// Custom Button Style
struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(height: 30)
            .background(Color.white.opacity(0.5))
            .cornerRadius(4)
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 0.5))
            .foregroundColor(.black)
    }
}

// Transaction Card
struct TransactionCard: View {
    var title: String
    var amount: String
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
            
            Text("Date : 11/02/2025 11:23")
                .font(.caption)
                .foregroundColor(.gray)
            
            Text("Vendeur : John Doe\nSession : Session de février")
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                Spacer()
                Text(amount)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(color)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.85))
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(color, lineWidth: 2))
    }
}

struct Tresorerie_Previews: PreviewProvider {
    static var previews: some View {
        Tresorerie()
    }
}
