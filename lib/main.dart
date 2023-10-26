import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mercado_libre/views/loginPage.dart';
import 'package:firebase_core/firebase_core.dart';



void main()async {WidgetsFlutterBinding.ensureInitialized(); 
 await Firebase.initializeApp(); runApp(GetMaterialApp(home: MyApp(),  debugShowCheckedModeBanner: false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),

      debugShowCheckedModeBanner: false,
    );
  }
}

