class Notificacion {
  final String descripcion; 
  final bool value;
  Notificacion({required this.descripcion, required this.value});
  
  String getDescripcion() => descripcion;
  bool getValue() => value;
}