import 'package:ejercicio3/class/autentication_filter_manager/autentication_filter_manager.dart';
import 'package:ejercicio3/class/email_filter/email_filter.dart';
import 'package:ejercicio3/class/notificacion/notificacion.dart';
import 'package:ejercicio3/class/password_case/password_case.dart';
import 'package:ejercicio3/class/password_length/password_length.dart';
import 'package:ejercicio3/class/password_number/password_number.dart';
import 'package:ejercicio3/class/password_special/password_special.dart';
import 'package:ejercicio3/components/input_component.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AutenticationFilterManager filters = AutenticationFilterManager();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String mensaje = "";
  @override
  void initState() {
    super.initState();
    filters.addFilter(EmailFilter());
    filters.addFilter(PasswordLength());
    filters.addFilter(PasswordCase());
    filters.addFilter(PasswordSpecial());
    filters.addFilter(PasswordNumber());
  }
  void validar(){
    final String email = emailController.text;
    final String password = passwordController.text;
    final Notificacion validado = filters.validate(email, password);
    setState(() {
      mensaje = validado.descripcion;
    });
    if(validado.value){
      filters.addEmail(email);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputComponent(
          emailController: emailController, 
          passwordController: passwordController, 
          validate: validar
        ),
        SizedBox(height: 20,), 
        Text(mensaje, style: TextStyle(
          color: mensaje == "Correo registrado con éxito" ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),)
      ],
    );
  }
}