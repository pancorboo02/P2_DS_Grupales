import 'package:ejercicio3/class/filter_object/filter_object.dart';
import 'package:ejercicio3/class/notificacion/notificacion.dart';

class EmailFilter extends FilterObject{
  @override
  Notificacion validate(String value) {
      RegExp emailValido = RegExp(r"^[^@]+@(gmail\.com|hotmail\.com)$");
      if(emailValido.hasMatch(value)){
        return Notificacion(descripcion: "ok", value: true);
      }
      return Notificacion(descripcion: "No es un email valido", value: false);
  }
}