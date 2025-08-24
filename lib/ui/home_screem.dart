import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/models/account.dart';
import 'package:flutter_banco_douro/services/account_service.dart';
import 'package:flutter_banco_douro/ui/styles/app_colors.dart';
import 'package:flutter_banco_douro/ui/widget/account_widget.dart';

class Homescreem extends StatelessWidget {
  const Homescreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.ligthGrey,
          title: Text("Sistema de Gestão de contas"),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "login");
            },
            icon: Icon(Icons.logout),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(future: AccountService().getAll(),
                builder: (context, snapshot){
                   switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                      return  Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.done:
                      {
                        if(snapshot.data == null || snapshot.data!.isEmpty){
                          return const Center(
                            child: Text("Nenhuma conta encontrada"),
                          );
                        } else {
                           List<Account> listAccounts = snapshot.data!;
                           return ListView.builder(
                             itemCount: listAccounts.length, itemBuilder: (context, index)
                           {
                             return AccountWidget(account: listAccounts[index]);
                           },);
                        }
                      }
                  }
                }




  )

  )

  ,

  );
}}
