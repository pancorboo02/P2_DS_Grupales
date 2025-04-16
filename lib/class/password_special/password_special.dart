import 'package:ejercicio3/class/filter_object/filter_object.dart';
import 'package:ejercicio3/class/notificacion/notificacion.dart';

class PasswordSpecial extends FilterObject{
  @override
  Notificacion validate(String value) {
    RegExp specialChar = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
    if(specialChar.hasMatch(value)){
      return Notificacion(
        descripcion: "ok", 
        value: true);
    }
    return Notificacion(
      descripcion: "La contraseña tiene que contener un caracter especial", 
      value: false);
  }
}