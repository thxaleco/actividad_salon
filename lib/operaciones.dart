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

void registrarCita(List<Cita> citas) {
  print('\n--- Registrar cita ---');

  final cliente = leerTexto('Nombre del cliente: ');
  if (cliente.isEmpty) {
    print('El nombre no puede estar vacío.');
    return;
  }

  final servicio = leerServicio();
  final dia = leerDia();
  final hora = leerHora();

  final cita = Cita(
      generarId(citas), cliente, servicio, dia, hora, servicios[servicio]!);
  citas.add(cita);
  print('Cita registrada con id ${cita.id}.');
}