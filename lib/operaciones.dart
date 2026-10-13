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