import 'package:bytebank/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/provider/transfers.dart';
import 'package:bytebank/widgets/transfer_tile.dart';
import 'package:provider/provider.dart';

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Transfers transfers = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent[700],
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.TRANSFER_FORM);
        },
      ),
      body: ListView.separated(
        itemCount: transfers.count,
        itemBuilder: (context, index) => TransferTile(transfers.byIndex(index)),
        separatorBuilder: (context, index) => const Divider(),
      )
    );
  }
}
