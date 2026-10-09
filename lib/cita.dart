class Cita {
  // Atributos
  int id;
  String cliente;
  String servicio;
  int dia;
  String hora;
  double precio;
 
  // Constructor
  Cita(this.id, this.cliente, this.servicio, this.dia, this.hora, this.precio);
 
  // Método
  void mostrarInformacion() {
    print('[$id] $cliente | $servicio | día $dia a las $hora | \$$precio');
  }
}
