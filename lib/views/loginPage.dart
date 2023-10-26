import 'package:flutter/material.dart';
import 'package:mercado_libre/views/homePage.dart';
import 'package:mercado_libre/views/inicioSesion.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Alinear al centro horizontalmente
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(29.7),
                child: SizedBox(
                    width: 170,
                    height: 66,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (Context) => HomePage()));
                        },
                        child: Text(
                          'Continuar como visitante',
                          style: TextStyle(color: Colors.blueAccent),
                        ))),
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17, top: 30),
                    child: Image.asset(
                      "assets/images/login.jpg",
                      height: 350,
                      width: 370,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 160),
          Container(
            child: ButtonBar(
              alignment: MainAxisAlignment
                  .center, // Alinear los botones al centro horizontalmente
              children: [
                SizedBox(
                  width: 380,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => inicioSesion()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Crear cuenta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: ButtonBar(
              alignment: MainAxisAlignment
                  .center, // Alinear los botones al centro horizontalmente
              children: [
                SizedBox(
                  width: 380,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => inicioSesion()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Color.fromARGB(255, 210, 222, 244),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      'Inicia Sesion',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 17,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
