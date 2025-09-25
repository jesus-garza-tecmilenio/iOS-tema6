// Modelo Usuario expandido para demostrar conceptos del Tema 6
struct Usuario {
    var nombre: String
    var id: Int?
    var email: String?
    var edad: Int?
    
    // 🔍 Computed property que usa guard para validación
    var esValido: Bool {
        guard !nombre.isEmpty else { return false }
        guard let edad = edad, edad >= 18 else { return false }
        return true
    }
    
    // 🚀 Método que demuestra uso de guard y función anidada
    func validarYFormatear() -> String {
        // Validaciones con guard
        guard !nombre.isEmpty else {
            return "❌ Nombre requerido"
        }
        
        guard let edad = edad, edad >= 18 else {
            return "❌ Edad inválida o menor de edad"
        }
        
        // Función anidada con sombreado de variables
        func formatearPerfil() -> String {
            let nombre = nombre.capitalized // Sombreado
            let categoria = edad < 30 ? "Joven" : "Adulto"
            
            // Función anidada dentro de función anidada
            func generarID() -> String {
                return id.map { "ID: \($0)" } ?? "Sin ID"
            }
            
            return """
            👤 \(nombre) (\(categoria))
            📧 \(email ?? "Sin email")
            🔢 \(generarID())
            """
        }
        
        return formatearPerfil()
    }
    
    // 🎯 Inicializador con validaciones usando guard
    init?(nombre: String, id: Int? = nil, email: String? = nil, edad: Int? = nil) {
        // Validar que el nombre no esté vacío
        guard !nombre.trimmingCharacters(in: .whitespaces).isEmpty else {
            return nil // Falla la inicialización
        }
        
        // Validar edad si se proporciona
        if let edad = edad {
            guard edad >= 0, edad <= 150 else {
                return nil
            }
        }
        
        // Validar email si se proporciona
        if let email = email {
            guard email.contains("@"), email.contains(".") else {
                return nil
            }
        }
        
        self.nombre = nombre.trimmingCharacters(in: .whitespaces)
        self.id = id
        self.email = email
        self.edad = edad
    }
}
