import 'cita.dart';
import 'datos.dart';
import 'entrada.dart';
import 'validaciones.dart';

int generarId(List<Cita> citas) {
  var mayor = 0;
  for (final cita in citas) {
    if (cita.id > mayor) mayor = cita.id;
  }
  return mayor + 1;
}

void registrarCita(List<Cita> citas, Set<String> horariosOcupados) {
  print('\n--- Registrar cita ---');

  final cliente = leerTexto('Nombre del cliente: ');
  if (cliente.isEmpty) {
    print('El nombre no puede estar vacío.');
    return;
  }

  final servicio = leerServicio();
  final dia = leerDia();
  final hora = leerHora();

  if (!horariosOcupados.add('$dia-$hora')) {
    print('Ese horario ya está ocupado.');
    return;
  }

  final cita = Cita(
      generarId(citas), cliente, servicio, dia, hora, servicios[servicio]!);
  citas.add(cita);
  print('Cita registrada con id ${cita.id}.');
}

void mostrarCitas(List<Cita> citas) {
  print('\n--- Todas las citas ---');

  if (citas.isEmpty) {
    print('No hay citas registradas.');
    return;
  }
  for (final cita in citas) {
    cita.mostrarInformacion();
  }
}

List<Cita> buscarPorCliente(List<Cita> citas, String texto) {
  final buscado = texto.toLowerCase();
  return citas.where((c) => c.cliente.toLowerCase().contains(buscado)).toList();
}

void buscarCitas(List<Cita> citas) {
  print('\n--- Buscar cita ---');

  final texto = leerTexto('Nombre del cliente a buscar: ');
  final encontradas = buscarPorCliente(citas, texto);

  if (encontradas.isEmpty) {
    print('No se encontraron citas para ese cliente.');
    return;
  }
  for (final cita in encontradas) {
    cita.mostrarInformacion();
  }
}

Cita? buscarPorId(List<Cita> citas, int id) {
  for (final cita in citas) {
    if (cita.id == id) return cita;
  }
  return null;
}
void modificarCita(List<Cita> citas, Set<String> horariosOcupados) {
  print('\n--- Modificar cita ---');

  if (citas.isEmpty) {
    print('No hay citas para modificar.');
    return;
  }

  final id = leerEntero('Id de la cita a modificar: ');
  final cita = buscarPorId(citas, id);
  if (cita == null) {
    print('No existe una cita con ese id.');
    return;
  }

  cita.mostrarInformacion();
  print('1. Cambiar servicio  2. Cambiar día 3. Cambiar hora');
  final opcion = leerEntero('Opción: ');

  switch (opcion) {
    case 1:
      final nuevoServicio = leerServicio();
      cita.servicio = nuevoServicio;
      cita.precio = servicios[nuevoServicio]!;
      print('Servicio actualizado.');
      break;
    case 2:
      final nuevoDia = leerDia();
      if (horariosOcupados.add('$nuevoDia')) {
        horariosOcupados.remove('${cita.dia}');
        cita.dia = nuevoDia;
        print('Día actualizado.');
      } else {
        print('Ese día ya está ocupado. No se hicieron cambios.');
      }
      break;
      case 3:
      final nuevaHora = leerHora();
      if (horariosOcupados.add('${cita.dia}-$nuevaHora')) {
        horariosOcupados.remove('${cita.dia}-${cita.hora}');
        cita.hora = nuevaHora;
        print('Hora actualizada.');
      } else {
        print('Ese horario ya está ocupado. No se hicieron cambios.');
      }
      break;
    
    default:
      print('Opción no válida.');
  }
}

void eliminarCita(List<Cita> citas, Set<String> horariosOcupados) {
  print('\n--- Eliminar cita ---');

  if (citas.isEmpty) {
    print('No hay citas para eliminar.');
    return;
  }

  final id = leerEntero('Id de la cita a eliminar: ');
  final cita = buscarPorId(citas, id);
  if (cita == null) {
    print('No existe una cita con ese id.');
    return;
  }

  cita.mostrarInformacion();
  final confirmacion =
      leerTexto('¿Seguro que quieres eliminarla? (s/n): ').toLowerCase();

  if (confirmacion == 's') {
    citas.remove(cita);
    horariosOcupados.remove('${cita.dia}-${cita.hora}');
    print('Cita eliminada.');
  } else {
    print('Operación cancelada.');
  }
}
