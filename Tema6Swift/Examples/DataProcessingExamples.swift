import Foundation

// MARK: - Ejemplos de Procesamiento de Datos Complejos

// 🔧 Función que demuestra múltiples patrones de guard
func procesarDatosComplejos(datos: [String: Any]?) -> String {
    // Guard para verificar que el diccionario existe
    guard let datos = datos else {
        return "❌ No hay datos para procesar"
    }
    
    // Guard para verificar múltiples valores del diccionario
    guard let nombre = datos["nombre"] as? String,
          let edad = datos["edad"] as? Int,
          !nombre.isEmpty,
          edad > 0 else {
        return "❌ Datos incompletos o inválidos"
    }
    
    // Guard con condiciones complejas
    guard edad >= 18,
          nombre.count >= 2,
          nombre.allSatisfy({ $0.isLetter || $0.isWhitespace }) else {
        return "❌ Datos no cumplen los requisitos mínimos"
    }
    
    // Función anidada con acceso a variables validadas
    func crearResumen() -> String {
        let categoria: String
        
        // Lógica local con alcances específicos
        switch edad {
        case 18...25:
            categoria = "Joven adulto"
        case 26...65:
            categoria = "Adulto"
        default:
            categoria = "Adulto mayor"
        }
        
        return "✅ Procesado: \(nombre) (\(categoria), \(edad) años)"
    }
    
    return crearResumen()
}

// Función de ejemplo para validar datos de entrada
func validarEntradaCompleja(input: String?) -> String {
    guard let input = input, !input.isEmpty else {
        return "❌ Entrada vacía"
    }
    
    // Función anidada para procesar
    func procesarTexto() -> String {
        let input = input.trimmingCharacters(in: .whitespaces) // Sombreado
        
        guard input.count >= 3 else {
            return "❌ Texto muy corto"
        }
        
        func formatearTexto() -> String {
            return input.uppercased()
        }
        
        return "✅ Texto procesado: \(formatearTexto())"
    }
    
    return procesarTexto()
}