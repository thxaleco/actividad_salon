import 'package:actividad_salon/cita.dart';
import 'package:actividad_salon/datos.dart';
import 'package:actividad_salon/entrada.dart';
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
  final horariosOcupados = <String>{};

  int opcion;
  do {
    mostrarMenu();
    opcion = leerEntero('Seleccione una opción: ');

    switch (opcion) {
      case 1:
        registrarCita(citas, horariosOcupados);
        break;
      case 2:
        mostrarCitas(citas);
        break;
      case 3:
        buscarCitas(citas);
        break;
      case 4:
        modificarCita(citas, horariosOcupados);
        break;
      case 5:
        eliminarCita(citas, horariosOcupados);
        break;
      case 6:
        mostrarResumen(citas);
        break;
      case 0:
        print('Hasta pronto.');
        break;
      default:
        print('Opción no válida.');
    }
  } while (opcion != 0);
}