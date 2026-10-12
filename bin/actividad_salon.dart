import 'package:actividad_salon/datos.dart';
import 'package:actividad_salon/entrada.dart';
import 'package:actividad_salon/cita.dart';
import 'package:actividad_salon/operaciones.dart';

void mostrarMenu() {
  print('\n$nombreSalon - SISTEMA DE GESTIÓN DE CITAS');
  print('-----------------------------');
  print('1. Registrar');
  print('2. Consultar todos');
  print('3. Buscar');
  print('4. Modificar');
  print('5. Eliminar');
  print('6. Mostrar resumen');
  print('0. Salir');
  print('-----------------------------');
}

void main() {
    final citas = <Cita>[];
    int opcion;
    do {
    mostrarMenu();
    opcion = leerEntero('Seleccione una opción: ');

    switch (opcion) {
      case 1:
        registrarCita(citas);
        break;
      case 2:
        print('Consultar (pendiente)');
        break;
      case 3:
        print('Buscar (pendiente)');
        break;
      case 4:
        print('Modificar (pendiente)');
        break;
      case 5:
        print('Eliminar (pendiente)');
        break;
      case 6:
        print('Resumen (pendiente)');
        break;
      case 0:
        print('Hasta pronto.');
        break;
      default:
        print('Opción no válida.');
    }
  } while (opcion != 0);
}