import 'package:bytebank/provider/transfers.dart';
import 'package:bytebank/routes/app_routes.dart';
import 'package:bytebank/views/transfer_form.dart';
import 'package:bytebank/views/transfer_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Transfers(),
        )
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        routes: {
          AppRoutes.HOME: (_) => TransferList(),
          AppRoutes.TRANSFER_FORM: (_) => TransferForm()
        },
      )
    );
  }
}