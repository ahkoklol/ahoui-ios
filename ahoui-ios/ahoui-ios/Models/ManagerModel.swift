struct Manager: Identifiable, Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
    let address: String
    let admin: Bool
}