import SwiftUI

// 🌍 Variables globales
var appName = "GestorUsuarios"
let maxUsuarios = 100
var contadorUsuarios = 0

struct ContentView: View {
    @State private var nombre: String = ""
    @State private var userId: String = ""
    @State private var mensaje: String = ""
    @State private var mostrarEjemplos = false
    @State private var tipoEjemplo = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text(appName)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // 📊 Mostrar estadísticas usando variables globales
            Text("Usuarios registrados: \(contadorUsuarios)/\(maxUsuarios)")
                .font(.caption)
                .foregroundColor(.gray)
            
            TextField("Ingresa tu nombre", text: $nombre)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Ingresa tu ID (opcional)", text: $userId)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            HStack {
                Button("Procesar Usuario") {
                    mensaje = procesarUsuario(nombre: nombre, id: Int(userId))
                }
                .buttonStyle(.borderedProminent)
                
                Button("Ejemplos de Alcance") {
                    mostrarEjemplos.toggle()
                }
                .buttonStyle(.bordered)
            }
            
            Text(mensaje)
                .foregroundColor(.blue)
                .padding()
            
            if mostrarEjemplos {
                VStack(alignment: .leading, spacing: 10) {
                    Text("🔍 Ejemplos del Tema 6:")
                        .font(.headline)
                    
                    // Selector de tipo de ejemplo
                    Picker("Tipo de ejemplo", selection: $tipoEjemplo) {
                        Text("Alcances básicos").tag(0)
                        Text("Guard vs If Let").tag(1)
                        Text("Validación completa").tag(2)
                        Text("Sombreado avanzado").tag(3)
                        Text("Datos complejos").tag(4)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    // Mostrar ejemplo según selección
                    ScrollView {
                        Text(obtenerEjemplo(tipo: tipoEjemplo))
                            .font(.caption)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxHeight: 200)
                }
            }
        }
        .padding()
    }
    
    // Función para obtener diferentes ejemplos
    func obtenerEjemplo(tipo: Int) -> String {
        switch tipo {
        case 0:
            return ejemplosDeAlcance()
        case 1:
            let guardResult = validarUsuarioConGuard(nombre: "Ana", edad: 25)
            let ifResult = validarUsuarioConIf(nombre: "Ana", edad: 25)
            return """
            🔍 Comparación Guard vs If Let:
            
            Guard let resultado: \(guardResult)
            If let resultado: \(ifResult)
            
            Guard: Variables disponibles en toda la función
            If let: Variables solo en el bloque if
            """
        case 2:
            let resultado = registrarUsuarioCompleto(
                nombre: "Juan",
                apellido: "Pérez",
                edad: 30,
                email: "juan@email.com"
            )
            return "🎯 Validación completa:\n\(resultado)"
        case 3:
            return "🌐 Sombreado de variables:\n\(demostrarAlcances())"
        case 4:
            let datos: [String: Any] = ["nombre": "María", "edad": 28]
            return "🔧 Procesamiento complejo:\n\(procesarDatosComplejos(datos: datos))"
        default:
            return ejemplosDeAlcance()
        }
    }
}

// 🚀 Función principal con validaciones usando guard
func procesarUsuario(nombre: String, id: Int?) -> String {
    guard !nombre.isEmpty else {
        return "❌ Error: El nombre no puede estar vacío"
    }
    
    guard let idSeguro = id else {
        contadorUsuarios += 1 // Acceso a variable global
        return "✅ Usuario \(nombre) registrado sin ID"
    }
    
    // Función anidada con sombreado de variables
    func generarMensajeFinal() -> String {
        let nombre = nombre.uppercased() // Sombreado: transforma el parámetro
        contadorUsuarios += 1 // Acceso a variable global
        return "✅ Usuario \(nombre) registrado con ID: \(idSeguro)"
    }
    
    return generarMensajeFinal()
}

#Preview {
    ContentView()
}
