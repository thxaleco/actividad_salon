import 'dart:io';

int leerEntero(String mensaje) {
  while (true) {
    stdout.write(mensaje);
    final numero = int.tryParse((stdin.readLineSync() ?? '').trim());
    if (numero != null) return numero;
    print('Por favor escribe un número entero válido.');
  }
}

String leerTexto(String mensaje) {
  stdout.write(mensaje);
  return (stdin.readLineSync() ?? '').trim();
}