import 'package:ejercicio_grupal_2/class/LLMStrategy/llm_strategy.dart';
import 'package:ejercicio_grupal_2/class/basic_llm/basic_llm.dart';
import 'package:ejercicio_grupal_2/class/expansion_llm/expansion_llm.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio Grupal Opcional',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StrategyHomePage(),
    );
  }
}

class StrategyHomePage extends StatefulWidget {
  @override
  _StrategyHomePageState createState() => _StrategyHomePageState();
}

class _StrategyHomePageState extends State<StrategyHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _respuesta = '';
  late LLMStrategy _selectedStrategy;

  final List<LLMStrategy> _strategies = [
    BasicLLM(),
    ExpansionLLM(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedStrategy = _strategies.first;
  }

  void _enviarMensaje() async {
    setState(() {
      _respuesta = "Cargando...";
    });

    String mensaje = _controller.text;
    String resultado = await _selectedStrategy.generarRespuesta(mensaje);

    setState(() {
      _respuesta = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejercicio Grupal Opcional"),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Autores:\nAntonio Pancorbo Morales\nLuis Alberto Mejía Troya\nManuel Jesús Junquera Lobón",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Selecciona el modelo LLM deseado:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButton<LLMStrategy>(
              value: _selectedStrategy,
              onChanged: (newStrategy) {
                setState(() {
                  _selectedStrategy = newStrategy!;
                });
              },
              items: _strategies.map((strategy) {
                return DropdownMenuItem(
                  value: strategy,
                  child: Text(strategy.getNombre()),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Escribe tu mensaje",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _enviarMensaje,
              child: Text("Enviar"),
            ),
            SizedBox(height: 20),
            Text(
              "Respuesta:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_respuesta,style: TextStyle(fontSize: 30, color:(_respuesta == "Cargando...")? Colors.white:Colors.blueAccent, backgroundColor: Colors.black),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
