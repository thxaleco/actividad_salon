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