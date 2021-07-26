import 'dart:math';
import 'package:bytebank/data/dummy_transfers.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class Transfers with ChangeNotifier {
  final Map<String, Transfer> _items = {...DUMMY_TRANSFERS};

  List<Transfer> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Transfer byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(Transfer transfer) {
    //adicionar
    final id = Random().nextDouble().toString();
    _items.putIfAbsent(
      id,
      () => Transfer(
        id: id,
        account: transfer.account,
        value: transfer.value,
      ),
    );
    notifyListeners();
  }
}
