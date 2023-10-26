import 'package:flutter/material.dart';
import 'package:mercado_libre/views/puntosEntrega.dart';

class formaEntrega extends StatefulWidget {
  const formaEntrega({super.key});

  @override
  State<formaEntrega> createState() => _formaEntregaState();
}

class _formaEntregaState extends State<formaEntrega> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(237, 249, 249, 249),
      appBar: AppBar(
        
        backgroundColor: Color.fromARGB(187, 234, 229, 229),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            child: Text(
              'Elige la forma de entrega',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.20),
          child: Container(
            width: 350,
            height: 180,
            child: Card(
              elevation: 0,
              margin: EdgeInsets.all(12.20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enviar a domicilio',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                        '15A Por 16 y 18 N.93 Colonia Centro 93-Maxcanu Residencial'),
                    Divider(
                      color: Colors.grey,
                      height: 50,
                    ),
                    Text('Editar o elegir otro domicilio',style: TextStyle(color: Colors.blueAccent),)
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.20),
          child: Container(
            width: 350,
            height: 180,
            child: Card(
              elevation: 0,
              margin: EdgeInsets.all(12.20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Retirar en un punto de entrega',
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                        '15A Por 16 y 18 N.93 Colonia Centro 93-Maxcanu Residencial'),
                    Divider(
                      color: Colors.grey,
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (Context)=> mapa()));
                      },
                      child: Text(
                        'Ver punto en el mapa o elegir otro',style: TextStyle(color: Colors.blueAccent),))
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
