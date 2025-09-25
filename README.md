# iOS-tema6

¡Bienvenido al repositorio del Tema 6 de nuestro curso de iOS con Swift!

## ¿Qué aprenderás en este tema?

En este módulo vas a comprender a fondo el alcance de constantes y variables en Swift, el uso correcto de `guard`, la diferencia entre `guard let` e `if let`, el concepto de sombreado de variables y cómo las funciones anidadas pueden ayudarte a escribir código más claro y seguro.

### Puntos clave que debes dominar:
- **Flujo de control y legibilidad:** Aprende a manejar casos especiales e inválidos desde el inicio para evitar código anidado y mejorar la claridad de tus funciones.
- **Uso de `guard`:** Descubre cómo validar condiciones y salir temprano de una función, separando las validaciones de la lógica principal. Recuerda: `guard let` deja las variables disponibles en toda la función.
- **Alcance (scope):**
  - Global: accesible en todo el programa, declarado fuera de funciones/clases. Úsalo con moderación.
  - Local: accesible solo dentro de funciones, bucles o bloques.
  - Un ámbito interno puede acceder a variables externas, pero no al revés.
  - Las funciones anidadas pueden capturar variables del ámbito padre.
- **Sombreado de variables:** Una variable local puede ocultar una del ámbito exterior. Esto es útil para transformar valores o crear copias locales.
- **Diferencias entre `guard let` e `if let`:** `guard let` deja las variables disponibles en toda la función, mientras que `if let` solo dentro del bloque.

## ¿Cómo se relaciona esto con el código de ejemplo?

He preparado varios archivos para que explores y experimentes con cada concepto:

- **ContentView.swift**
  - Aquí puedes interactuar con la app y ver ejemplos prácticos de validaciones, alcance global/local y el uso de `guard`.
  - Usa el selector para ver ejemplos de cada concepto en acción.

- **Models/Usuario.swift**
  - El modelo `Usuario` incluye validaciones con `guard`, un inicializador que puede fallar si los datos no son válidos, y ejemplos de sombreado y funciones anidadas.

- **Examples/GuardExamples.swift**
  - Aquí puedes comparar directamente `guard let` vs `if let` y ver cómo se valida la entrada de datos de manera segura y legible.

- **Examples/ScopeExamples.swift**
  - Explora cómo funcionan los alcances global, local y de bloque, y cómo el sombreado de variables puede ayudarte a evitar errores y escribir código más claro.

- **Examples/DataProcessingExamples.swift**
  - Ejemplos de validación y procesamiento de datos complejos usando múltiples patrones de `guard` y funciones anidadas.

## Checkpoint de repaso

Antes de avanzar, asegúrate de poder responder:
- ¿Cómo usar `guard` para que tu código sea más legible?
- ¿Cuál es la diferencia entre `guard let` e `if let`?
- ¿Cómo escribir una función que valide argumentos inválidos?
- ¿Qué diferencia hay entre alcance global y local?
- ¿Cómo puedes reutilizar nombres de variables con sombreado?

## Recomendaciones
- Te sugiero que modifiques los ejemplos, agregues tus propios casos y experimentes con los alcances y validaciones.
- Si tienes dudas, revisa la documentación oficial de Swift o pregunta en clase.

## Referencias
- Documentación oficial de Swift (Control Flow, Variables)
- SwiftUI y patrones modernos
- Libro: App Development with Swift (Apple Education)

¡Éxito programando y no dudes en preguntar si algo no queda claro!
