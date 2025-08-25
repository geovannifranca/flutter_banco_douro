import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/ui/styles/app_colors.dart';

class AddAccountModelWidget extends StatefulWidget {
  const AddAccountModelWidget({super.key});

  @override
  State<AddAccountModelWidget> createState() => _AddAccountModelWidgetState();
}

class _AddAccountModelWidgetState extends State<AddAccountModelWidget> {
  String _accountType = "ANBROSIA";


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        left: 32,
        top: 32,
        right: 32,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      height: size.height * 0.75,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                "assets/images/icon_add_account.png",
                width: 64,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Adicionar nova conta",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
            ),
            const SizedBox(height: 16),
            const Text(
              "Preencha os dados abaixo:",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),

            TextFormField(
              decoration: InputDecoration(label: const Text("Nome")),
            ),
            TextFormField(
              decoration: InputDecoration(label: const Text("Sobre Nome")),
            ),
            const SizedBox(height: 16),
            Text("Tipo da Conta"),
            DropdownButton<String>(
              value: _accountType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: "ANBROSIA", child: Text("ANBROSIA")),
                DropdownMenuItem(value: "CANGICA",child: Text("CANGICA")),
                DropdownMenuItem(value: "PUDIM",child: Text("PUDIM")),
                DropdownMenuItem(value: "BRIGADEIRO",child: Text("item 3")),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _accountType = value;
                  });
                }
              },
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.orange),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(AppColors.orange),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
