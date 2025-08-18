import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/app_colors.dart';

class Homescreem extends StatelessWidget {
  const Homescreem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.ligthGrey,
        title: Text("Sistema de Gestão de contas"),
        leading: IconButton(onPressed: (){
            Navigator.pushReplacementNamed(context, "login");
          },
            icon: Icon(Icons.logout),
          ),
      ),
    );
  }
}
