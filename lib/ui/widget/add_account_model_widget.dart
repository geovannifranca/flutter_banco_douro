import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/services/account_service.dart';
import 'package:uuid/uuid.dart';

import '../../models/account.dart';
import '../styles/app_colors.dart';

class AddAccountModelWidget extends StatefulWidget {
  const AddAccountModelWidget({super.key});

  @override
  State<AddAccountModelWidget> createState() => _AddAccountModelWidgetState();
}

class _AddAccountModelWidgetState extends State<AddAccountModelWidget> {
  String _accountType = "ANBROSIA";

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lasrnameController = TextEditingController();
  final AccountService _accountService = AccountService();
  bool isLoading = false;

  void clouseModal(){
    Navigator.pop(context);
  }

  _onButtomCancelClicked() {
    if (!isLoading) {
      Navigator.pop(context);
    }
  }

  _onButtomSendClicked() async{
    if(!isLoading){
      setState(() {
        isLoading = true;
      });
      String name = _nameController.text;
      String lastName = _lasrnameController.text;
      Account account = Account(
        id: Uuid().v1(),
        name: name,
        lastName: lastName,
        balance: 0,
        accountType: _accountType,
      );

        if(name.isNotEmpty && lastName.isNotEmpty){
          await _accountService.addAccount(account);
        }
      clouseModal();


    }

  }



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
              controller: _nameController,
              decoration: InputDecoration(label: const Text("Nome")),
            ),
            TextFormField(
              controller: _lasrnameController,
              decoration: InputDecoration(label: const Text("Sobre Nome")),
            ),
            const SizedBox(height: 16),
            Text("Tipo da Conta"),
            DropdownButton<String>(
              value: _accountType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(value: "ANBROSIA", child: Text("ANBROSIA")),
                DropdownMenuItem(value: "CANGICA", child: Text("CANGICA")),
                DropdownMenuItem(value: "PUDIM", child: Text("PUDIM")),
                DropdownMenuItem(
                  value: "BRIGADEIRO",
                  child: Text("BRIGADEIRO"),
                ),
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
                    style: ButtonStyle(),
                    onPressed: (isLoading) ? null : _onButtomCancelClicked,
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
                    onPressed: _onButtomSendClicked,
                    child: (isLoading) ?  CircularProgressIndicator() :  Text(
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
