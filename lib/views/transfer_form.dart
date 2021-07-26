import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/provider/transfers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferForm extends StatelessWidget {
  
  final _form = GlobalKey<FormState>();
  final Map<String,String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text("Criando Transferência"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Número da conta', 
                  hintText: "0000"),
                validator: (value){
                  if (value == null || value.trim().isEmpty) {
                    return 'Insira o número da conta!';
                  }
                  if (value.trim().length < 4) {
                    return 'Número da conta inválido! No mínimo 4 dígitos.';
                  }
                },
                onSaved: (value){
                    _formData['account'] = value!;
                    print(value);
                } 
              ),
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on_sharp),
                  labelText: 'Valor', 
                  hintText: "0.00"),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Insira um valor para a transferência!';
                  }                
                }, 
                onSaved: (value){
                  _formData['value'] = value!;
                  print(value);
                } 
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Center(
                  child: ElevatedButton(
                    child: Text("Confirmar"),
                    onPressed: () {
                      final isValid = _form.currentState!.validate();
                      if(isValid){
                        _form.currentState!.save();
                        Provider.of<Transfers>(context, listen: false).put(
                          Transfer(
                            account: _formData['account']!, 
                            value: _formData['value']!,
                          ),
                        );                      
                        Navigator.of(context).pop();                        
                      }
                    },
                    style: ElevatedButton.styleFrom( primary: Colors.blueAccent[700])
                  )
                )
              )
            ],
          )
        )
      )
    );
  }
}