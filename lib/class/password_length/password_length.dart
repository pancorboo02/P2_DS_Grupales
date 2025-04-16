import 'package:ejercicio3/class/filter_object/filter_object.dart';
import 'package:ejercicio3/class/notificacion/notificacion.dart';

class PasswordLength extends FilterObject{
  @override
  Notificacion validate(String value){
    if(value.length >= 8){
      return Notificacion(descripcion: "ok", value: true);
    }
    return Notificacion(
      descripcion: "La contraseña tiene que tener una longitud mínima de 8",
      value: false);
  }
}