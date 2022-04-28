import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab14/pages/mostrar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List datos = [];

  Future<String> jsonEstudiante() async {
    var jsonText = await rootBundle.loadString('assets/estudiante.json');
    setState(() => datos = json.decode(jsonText));
    return jsonText;
  }

  @override
  void initState() {
    super.initState();
    jsonEstudiante();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 233, 57, 115),
          title: const Text("Estudiantes"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/originals/9e/a9/5e/9ea95e67a35d51a1bf5ac9f1c0bf590d.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
              itemCount: datos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    datos[index]["nombre"],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(datos[index]["carrera"]),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Mostrar(
                          nombre: datos[index]["nombre"],
                          matricula: datos[index]["matricula"],
                          carrera: datos[index]["carrera"],
                          semestre: datos[index]["semestre"],
                          telefono: datos[index]["telefono"],
                          correo: datos[index]["correo"],
                        ),
                      ),
                    );
                  },
                );
              }),
        ));
  }
}
