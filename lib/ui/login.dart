import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/app_colors.dart';


class LoginScreem extends StatelessWidget {
  const LoginScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/banner.png"),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset("assets/images/stars.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 128),
                Image.asset(
                    "assets/images/logo.png",
                  width: 120,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 32),
                    Text(
                      "Sistema de Gestão de Contas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                    SizedBox(height: 32),
                    TextFormField(
                      decoration: InputDecoration(
                        label: const Text("E-mail"),
                      ),
                    ),
                    SizedBox(height: 32),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text("Senha"),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context,"home");
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.orange,
                        ),
                      ),
                      child: const
                      Text(
                        "Entrar",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
