import 'package:ejercicio3/class/filter_object/filter_object.dart';
import 'package:ejercicio3/class/notificacion/notificacion.dart';

class PasswordNumber extends FilterObject{
  @override
  Notificacion validate(String value) {
    RegExp specialChar = RegExp(r'[0-9]');
    if(specialChar.hasMatch(value)){
      return Notificacion(
        descripcion: "ok", 
        value: true);
    }
    return Notificacion(
      descripcion: "La contraseña tiene que contener al menos un número", 
      value: false);
  }
}