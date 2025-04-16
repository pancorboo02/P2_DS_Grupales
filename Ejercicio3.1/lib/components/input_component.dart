import 'package:flutter/material.dart';

class InputComponent extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function() validate;
  const InputComponent({super.key, required this.emailController, required this.passwordController, required this.validate});

  @override
  State<InputComponent> createState() => _InputState();
}

class _InputState extends State<InputComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: widget.emailController,
            decoration: InputDecoration(
              labelText: "Correo electrónico",
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(
              ) 
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: widget.passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Contraseña",
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(),
            ),
          ),
        ), 
        ElevatedButton(
          onPressed: widget.validate, 
          child: Text("Registrar")),
      ],
    );
  }
}