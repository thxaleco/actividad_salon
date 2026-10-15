# Sistema de gestión de citas – Salón de belleza NALA

Proyecto Momento Evaluativo 1 · Lenguaje de Programación para APPs · UCC
Autora: Alejandra María Correa Jaramillo

## Descripción

Aplicación de consola en Dart para administrar las citas del salón de belleza NALA.
Funciona con un menú interactivo de seis opciones donde permite ejecutar diversas acciones alrededor de las citas. Los datos se guardan en memoria, por lo que se pierden al cerrar el programa.

## Funcionalidades

1. Registrar una cita
2. Consultar todas las citas
3. Buscar citas por nombre del cliente
4. Modificar el servicio, el día o la hora de una cita
5. Eliminar una cita (con confirmación)
6. Mostrar el resumen de un día (pide ser seleccionado del 1 al 31): se presentan citas por servicio y espacios ocupados y libres
0. Salir

## Cómo ejecutarlo

Se necesita tener instalado el SDK de Dart. Desde la carpeta del proyecto:

```
dart pub get
dart run
```

## Estructura del proyecto

| Archivo | Qué contiene |

| `bin/actividad_salon.dart` | Menú principal, `switch`, la List de citas y el Set de horarios ocupados |
| `lib/cita.dart` | Clase `Cita` |
| `lib/datos.dart` | Constante con el nombre del salón, Map de servicios y List de horas |
| `lib/entrada.dart` | Funciones `leerEntero` y `leerTexto` |
| `lib/validaciones.dart` | Funciones `leerDia`, `leerServicio` y `leerHora` |
| `lib/operaciones.dart` | Registrar, consultar, buscar, modificar, eliminar y resumen |

## Validaciones

- Si se escribe algo que no es un número, se vuelve a preguntar.
- El nombre del cliente no puede estar vacío.
- El día debe estar entre 1 y 31.
- El servicio debe existir en la carta y la hora debe estar en el horario del salón.
- No se pueden registrar dos citas en el mismo día y hora.
- Al eliminar una cita se pide confirmación.


## Estructuras de datos

- **List `citas`:** Guarda las citas que se vayan registrando y quedan es este orden.
- **Set `horariosOcupados`:** Guarda el día y la hora, no permite que hayan elementos duplicados y cada cita deentro del registro es única.
- **Map `servicios`:** Guarda el servicio directamente relacionado al precio, permite almacenar datos pares clave - valor, en el ejercicio fue: Servicio - Valor

## Investigación: clases y objetos

### ¿Qué es una clase?

Una clase es lo que define la estructura o los elementos que tendrá un objeto, por ejemplo en el ejercicio se utiliza la clase "Cita" y esta al registarse debe de tener: id, cliente, día, hora, servicio y precio.

#### Ventajas de trabajar con clases en Dart

- Organización: permite agrupar datos y métodos relacionados a una sola plantilla.
- Flutter: cada componenete visual es una clase.
- Reutilización: herencia y reutilización de código.
- Flexibilidad en constructores: optimiza el rendimiento en Flutter

### ¿Qué es un objeto?

Un objeto es algo creado a partir de las clases, contiene atributos, que son los datos y comportamientos que son las funciones y los métodos.

### ¿Cuál es la diferencia entre una clase y un objeto?

La diferencia es que la clase es como el molde y el objeto es la utilización de este, es crear algo a partir de los parámetros que se establecen en la clase.

### ¿Qué es un atributo?

Un atributo es una variable definida por la clase, almacena datos con su tipo y nombre dentro de la clase.

### ¿Qué es un método?

Un método es una función que pertenece a una clase, define las acciones y comportamientos que un objeto puede realizar.

### ¿Para qué sirve un constructor?

El constructor sirve para crear un objeto y llenar los atributos en el momento en que este se crea.

## Aplicación en el proyecto

La clase del proyecto es `Cita` (archivo `lib/cita.dart`).

| Clase | `Cita` |
| Atributos | `id`, `cliente`, `servicio`, `dia`, `hora`, `precio` |
| Constructor | `Cita(this.id, this.cliente, this.servicio, this.dia, this.hora, this.precio)` |
| Método | `mostrarInformacion()` |
| Dónde se crea un objeto | En la función `registrarCita`, archivo `lib/operaciones.dart` |

