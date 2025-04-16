import 'package:ejercicio3/class/filter_object/filter_object.dart';
import 'package:ejercicio3/class/notificacion/notificacion.dart';

class PasswordCase extends FilterObject{
  @override
  Notificacion validate(String value) {
    bool hasLower = value.contains(RegExp(r"[a-z]"));
    bool hasUpper = value.contains(RegExp(r"[A-Z]"));
    if(hasLower && hasUpper){
      return Notificacion(descripcion: "Correo registrado con éxito", value: true);
    } 
    return Notificacion(
      descripcion: "La contraseña tiene que contener una letra mayuscula y otra minuscula",
       value: false);
  }
}