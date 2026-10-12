import 'entrada.dart';
import 'datos.dart';

int leerDia() {
  int dia;
  do {
    dia = leerEntero('Día del mes (1-31): ');
    if (dia < 1 || dia > 31) {
      print('El día debe estar entre 1 y 31.');
    }
  } while (dia < 1 || dia > 31);
  return dia;
}

String leerServicio() {
  print('Servicios disponibles:');
  servicios.forEach((nombre, precio) => print('- $nombre: \$${precio.toStringAsFixed(0)}'));

  while (true) {
    final escrito = leerTexto('Servicio: ').toLowerCase();
    for (final nombre in servicios.keys) {
      if (nombre.toLowerCase() == escrito) return nombre;
    }
    print('Ese servicio no existe.');
  }
}

String leerHora() {
  print('Horas disponibles:');
  for (final h in horasDisponibles) {
    print('- $h');
  }

  while (true) {
    final hora = leerTexto('Hora (ej: 09:00): ');
    if (horasDisponibles.contains(hora)) return hora;
    print('Esa hora no está en el horario del salón.');
  }
}