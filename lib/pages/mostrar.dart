import 'package:flutter/material.dart';

class Mostrar extends StatelessWidget {
  String nombre = "";
  String matricula = "";
  String carrera = "";
  String semestre = "";
  String telefono = "";
  String correo = "";
  Mostrar(
      {Key? key,
      required this.nombre,
      required this.matricula,
      required this.carrera,
      required this.semestre,
      required this.telefono,
      required this.correo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 233, 57, 115),
          title: Text(nombre),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://marketplace.canva.com/EAEtlMvlBDg/1/0/900w/canva-pastel-peach-watercolour-mobile-phone-wallpaper--8ZGLXxywc8.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10, 90, 10, 0),
          //padding: EdgeInsets.all(100.0),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Text(
                  "Nombre: " +
                      nombre +
                      "\n\n" +
                      "Matricula: " +
                      matricula +
                      "\n\n" +
                      "Carrera: " +
                      carrera +
                      "\n\n" +
                      "Semestre: " +
                      semestre +
                      "\n\n" +
                      "Telefono: " +
                      telefono +
                      "\n\n" +
                      "Correo: " +
                      correo,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                );
              }),
        ));
  }
}
