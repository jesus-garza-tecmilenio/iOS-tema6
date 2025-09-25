import Foundation

// MARK: - Ejemplos de Guard vs If Let

// 🔍 Ejemplo: Diferencia entre guard let e if let
func validarUsuarioConGuard(nombre: String?, edad: Int?) -> String {
    // Guard let: disponible en todo el ámbito de la función
    guard let nombreSeguro = nombre, !nombreSeguro.isEmpty else {
        return "❌ Nombre inválido"
    }
    
    guard let edadSegura = edad, edadSegura >= 18 else {
        return "❌ Edad inválida o menor de edad"
    }
    
    // nombreSeguro y edadSegura están disponibles aquí
    return "✅ Usuario válido: \(nombreSeguro), \(edadSegura) años"
}

func validarUsuarioConIf(nombre: String?, edad: Int?) -> String {
    // If let: solo disponible dentro del bloque if
    if let nombreSeguro = nombre, !nombreSeguro.isEmpty {
        if let edadSegura = edad, edadSegura >= 18 {
            return "✅ Usuario válido: \(nombreSeguro), \(edadSegura) años"
        } else {
            return "❌ Edad inválida"
        }
    } else {
        return "❌ Nombre inválido"
    }
    // Aquí no tenemos acceso a nombreSeguro ni edadSegura
}

// 🎯 Función con validación completa de argumentos inválidos
func registrarUsuarioCompleto(nombre: String?, apellido: String?, edad: Int?, email: String?) -> String {
    // Validaciones usando múltiples guard
    guard let nombre = nombre, !nombre.trimmingCharacters(in: .whitespaces).isEmpty else {
        return "❌ Error: Nombre requerido"
    }
    
    guard let apellido = apellido, !apellido.trimmingCharacters(in: .whitespaces).isEmpty else {
        return "❌ Error: Apellido requerido"
    }
    
    guard let edad = edad, edad >= 18, edad <= 120 else {
        return "❌ Error: Edad debe estar entre 18 y 120 años"
    }
    
    guard let email = email, email.contains("@"), email.contains(".") else {
        return "❌ Error: Email inválido"
    }
    
    // Función anidada que demuestra captura de variables del ámbito padre
    func generarPerfilCompleto() -> String {
        let nombre = nombre.capitalized // Sombreado: transforma el parámetro
        let apellido = apellido.capitalized // Sombreado
        
        // Función anidada dentro de función anidada
        func generarID() -> String {
            let prefijo = "USR"
            let numero = String(format: "%04d", Int.random(in: 1...9999))
            return "\(prefijo)-\(numero)"
        }
        
        return """
        👤 Perfil creado:
        Nombre completo: \(nombre) \(apellido)
        Edad: \(edad) años
        Email: \(email)
        ID generado: \(generarID())
        """
    }
    
    return generarPerfilCompleto()
}