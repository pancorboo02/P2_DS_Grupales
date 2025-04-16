import 'package:ejercicio3/class/email_filter/email_filter.dart';
import 'package:ejercicio3/class/filter_object/filter_object.dart';
import 'package:ejercicio3/class/notificacion/notificacion.dart';

class AutenticationFilterManager {
  List<FilterObject> filters = [];
  List<String> emails = [];

  void addFilter(FilterObject filter) {
    filters.add(filter);
  }

  Notificacion validate(String email, String password) {
    if (emails.contains(email)) {
      return Notificacion(descripcion: "El email ya existe", value: false);
    }

    for (var filter in filters) {
      Notificacion result;

      if (filter is EmailFilter) {
        result = filter.validate(email);
      } else {
        result = filter.validate(password);
      }

      if (!result.value) {
        return result; 
      }
    }

    return Notificacion(descripcion: "ok", value: true);
  }

  void addEmail(String email) {
    emails.add(email);
  }
}
