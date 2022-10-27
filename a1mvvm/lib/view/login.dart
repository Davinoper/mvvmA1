import 'package:flutter/material.dart';
import 'form.dart';
import 'package:a1mvvm/viewModel/viewModel.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override

  String email = "";
  String senha= "";

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                    autofocus: true,
                    onChanged: (String value){
                      email = value;
                    },
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.blue, fontSize: 30),
                    decoration: InputDecoration(
                      labelText:"Email",
                      labelStyle: TextStyle(color: Colors.black),
                    )
                ),
                TextField(
                    autofocus: true,
                    onChanged: (String value){
                      senha = value;
                    },
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.blue, fontSize: 30),
                    decoration: InputDecoration(
                      labelText:"Senha",
                      labelStyle: TextStyle(color: Colors.black),
                    )
                ),
                ButtonTheme(
                  height: 60.0,
                  child: FloatingActionButton(
                    onPressed: () => {
                      if(ViewModel.login(email, senha)){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => FormFood()))
                      }
                    },
                    shape: new RoundedRectangleBorder(borderRadius:
                    new BorderRadius.circular(30.0)),
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                )
              ],
            ),
          ),
        )

    );
  }
}