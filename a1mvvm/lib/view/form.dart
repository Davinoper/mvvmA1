import 'dart:js';

import 'package:a1mvvm/model/endereco.dart';
import 'package:a1mvvm/viewModel/viewModel.dart';
import 'package:flutter/material.dart';


class FormFood extends StatefulWidget{
  @override
  _FormFoodState createState() => _FormFoodState();
}

class _FormFoodState extends State<FormFood>{

  String _cep = "";
  Endereco _endereco = Endereco.end();

  Future getEnd() async{
    Endereco end = await ViewModel.find(_cep);
    setState(() {
      _endereco =  end;
    });
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Buscador de cep')),

            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment:  MainAxisAlignment.spaceAround,
                children: [
                  TextField(
                      autofocus: true,
                      onChanged: (String value){
                        _cep = value;
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.blue, fontSize: 30),
                      decoration: InputDecoration(
                        labelText:"Cep",
                        labelStyle: TextStyle(color: Colors.black),
                      )
                  ),
                  DataTable(columns: [
                    DataColumn(label: Text("Cidade")),
                    DataColumn(label: Text("Estado")),
                    DataColumn(label: Text("Bairro")),
                    DataColumn(label: Text("Rua")),
                    DataColumn(label: Text("Serviço")),
                  ], rows: [
                    DataRow(cells:[
                      DataCell(Text(_endereco.city ?? "")),
                      DataCell(Text(_endereco.state ?? "")),
                      DataCell(Text(_endereco.neighborhood ?? "")),
                      DataCell(Text(_endereco.street ?? "")),
                      DataCell(Text(_endereco.service ?? "")),
                    ])
                  ]),
                  ButtonTheme(
                    height: 60.0,
                    child: FloatingActionButton(
                      onPressed: () async => {
                        await getEnd(),
                      },
                      shape: new RoundedRectangleBorder(borderRadius:
                      new BorderRadius.circular(30.0)),
                      child: Text(
                        "Pesquisar",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ]
            )
        )
    ) ;
  }
}