import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:metamask/models/transaction_model.dart';
import 'package:metamask/utils/ether_service.dart';

class TransactionApi {
  final _apikey = 'FX9JE19S7JCCKYBTK1DUDTVVR7B4BV31NA';
  late http.Response _response;

  Future<void> transactions() async {
    try {
      final uri = Uri.https('api-testnet.polygonscan.com', '/api', {
        'module': 'account',
        'action': 'txlist',
        'address': listenableSession.value!.accounts[0],
        'startblock': '0',
        'endblock': '99999999',
        'page': '1',
        'offset': '1000',
        'sort': 'desc',
        'apikey': _apikey,
      });

      _response = await http.get(uri);

      if (_response.statusCode == 200) {
        listenableTransactions.value =
            transactionModelFromMap(_response.body).transactions;
      }
    } catch (_) {
      debugPrint('Error occured $_');
    }
  }
}
