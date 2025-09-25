import Foundation

// MARK: - Ejemplos de Alcance y Sombreado

// 🌐 Variable global para ejemplos de alcance
let mensajeGlobal = "Mensaje desde ámbito global"

// Función que demuestra diferentes alcances y sombreado
func demostrarAlcances() -> String {
    let mensajeLocal = "Mensaje desde ámbito local"
    var resultado = ""
    
    // Bloque 1: Alcance de bloque
    do {
        let mensajeBloque = "Mensaje desde bloque 1"
        let mensajeGlobal = "Mensaje sombreado en bloque" // Sombreado
        resultado += "Bloque 1 - Global: \(mensajeGlobal)\n" // Usa la versión sombreada
        resultado += "Bloque 1 - Local: \(mensajeLocal)\n"
        resultado += "Bloque 1 - Bloque: \(mensajeBloque)\n"
    }
    
    // Bloque 2: Otro alcance
    for i in 1...2 {
        let mensajeLoop = "Mensaje desde loop \(i)"
        let mensajeLocal = "Mensaje sombreado en loop \(i)" // Sombreado
        resultado += "Loop \(i) - Local: \(mensajeLocal)\n" // Usa la versión sombreada
        resultado += "Loop \(i) - Loop: \(mensajeLoop)\n"
    }
    
    resultado += "Función - Global: \(mensajeGlobal)\n" // Usa la versión global original
    resultado += "Función - Local: \(mensajeLocal)\n"
    
    return resultado
}

// Ejemplos de alcance básico con funciones anidadas
func ejemplosDeAlcance() -> String {
    // Ejemplo de constante local
    let usuarioEjemplo = "JuanDoe"
    
    // Ejemplo de variable de estado
    var mensajeEstado = "Bienvenido, \(usuarioEjemplo)"
    
    // Función anidada que captura variables del ámbito padre
    func obtenerID() -> Int {
        // Puede acceder a usuarioEjemplo y mensajeEstado
        return usuarioEjemplo.count * 100
    }
    
    // Función anidada con sombreado
    func procesarMensaje() -> String {
        let usuarioEjemplo = "Usuario Transformado" // Sombreado
        return "ID: \(obtenerID()), Usuario: \(usuarioEjemplo)"
    }
    
    return "\(mensajeEstado). \(procesarMensaje())"
}