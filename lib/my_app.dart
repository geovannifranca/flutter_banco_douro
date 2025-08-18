import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/home_screem.dart';
import 'package:flutter_banco_douro/ui/login.dart';

class  BancoDouroApp extends StatelessWidget{
  const BancoDouroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        "login": (context) => LoginScreem(),
        "home": (context) => Homescreem(),
      },
      title: "Banco Douro App",
      theme: ThemeData(),
      initialRoute: "login",
    );

  }
}