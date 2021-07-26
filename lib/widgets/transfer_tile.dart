import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferTile extends StatelessWidget {

  final Transfer transfer;
  const TransferTile(this.transfer);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      padding: EdgeInsets.all(5),
      child: ListTile(
        leading: Icon(Icons.monetization_on_sharp,color: Colors.green[900]),
        title: Text(transfer.value),
        subtitle: Text(transfer.account),
        dense: true,
      ),
    );
  }
}