//
// import 'dart:convert';
// import 'dart:math';
//
// import 'package:intl/intl.dart';
//
// TransactionModel transactionModelFromMap(String str) => TransactionModel.fromMap(json.decode(str));
//
// String transactionModelToMap(TransactionModel data) => json.encode(data.toMap());
//
// class TransactionModel {
//   TransactionModel({
//     required this.status,
//     required this.message,
//     required this.transactions,
//   });
//
//   String status;
//   String message;
//   List<Transactions> transactions;
//
//   factory TransactionModel.fromMap(Map<String, dynamic> json) => TransactionModel(
//     status: json['status'],
//     message: json['message'],
//     transactions: List<Transactions>.from(json['result'].map((x) => Transactions.fromMap(x))),
//   );
//
//   Map<String, dynamic> toMap() => {
//     'status': status,
//     'message': message,
//     'transactions': List<dynamic>.from(transactions.map((x) => x.toMap())),
//   };
// }
//
// class Transactions {
//   Transactions({
//     required this.blockNumber,
//     required this.timeStamp,
//     required this.hash,
//     required this.from,
//     required this.to,
//     required this.value,
//     required this.contractAddress,
//     required this.input,
//     required this.type,
//     required this.gas,
//     required this.gasUsed,
//     required this.traceId,
//     required this.isError,
//     required this.errCode,
//   });
//
//   String blockNumber;
//   String timeStamp;
//   String hash;
//   String from;
//   String to;
//   String value;
//   String contractAddress;
//   String input;
//   String type;
//   String gas;
//   String gasUsed;
//   String traceId;
//   String isError;
//   String errCode;
//
//   factory Transactions.fromMap(Map<String, dynamic> json) => Transactions(
//     blockNumber: json['blockNumber'],
//     timeStamp: DateFormat('h:mm a').format(DateTime.parse(json['timeStamp'])),
//     hash: json['hash'],
//     from: json['from'],
//     to: json['to'],
//     value: (double.tryParse(json['value'])! / pow(10, 18)).toStringAsFixed(3) ,
//     contractAddress: json['contractAddress'],
//     input: json['input'],
//     type: json['type'],
//     gas: (double.tryParse(json['gas'])! / pow(10, 18)).toStringAsFixed(3),
//     gasUsed: json['gasUsed'],
//     traceId: json['traceId'],
//     isError: json['isError'],
//     errCode: json['errCode'],
//   );
//
//   Map<String, dynamic> toMap() => {
//     'blockNumber': blockNumber,
//     'timeStamp': timeStamp,
//     'hash': hash,
//     'from': from,
//     'to': to,
//     'value': value,
//     'contractAddress': contractAddress,
//     'input': input,
//     'type': type,
//     'gas': gas,
//     'gasUsed': gasUsed,
//     'traceId': traceId,
//     'isError': isError,
//     'errCode': errCode,
//   };
// }


import 'dart:convert';
// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromMap(jsonString);

import 'dart:math';

import 'package:intl/intl.dart';

TransactionModel transactionModelFromMap(String str) => TransactionModel.fromMap(json.decode(str));

String transactionModelToMap(TransactionModel data) => json.encode(data.toMap());

class TransactionModel {
  TransactionModel({
    required this.status,
    required this.message,
    required this.transactions,
  });

  String status;
  String message;
  List<Transactions> transactions;

  factory TransactionModel.fromMap(Map<String, dynamic> json) => TransactionModel(
    status: json['status'],
    message: json['message'],
    transactions: List<Transactions>.from(json['result'].map((x) => Transactions.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    'status': status,
    'message': message,
    'transactions': List<dynamic>.from(transactions.map((x) => x.toMap())),
  };
}

class Transactions {
  Transactions({
    required this.blockNumber,
    required this.timeStamp,
    required this.hash,
    required this.nonce,
    required this.blockHash,
    required this.transactionIndex,
    required this.from,
    required this.to,
    required this.value,
    required this.gas,
    required this.gasPrice,
    required this.isError,
    required this.txreceiptStatus,
    required this.input,
    required this.contractAddress,
    required this.cumulativeGasUsed,
    required this.gasUsed,
    required this.confirmations,
    required this.methodId,
    required this.functionName,
  });

  String blockNumber;
  String timeStamp;
  String hash;
  String nonce;
  String blockHash;
  String transactionIndex;
  String from;
  String to;
  String value;
  String gas;
  String gasPrice;
  String isError;
  String txreceiptStatus;
  String input;
  String contractAddress;
  String cumulativeGasUsed;
  String gasUsed;
  String confirmations;
  String methodId;
  String functionName;

  factory Transactions.fromMap(Map<String, dynamic> json) => Transactions(
    blockNumber: json['blockNumber'] ?? '',
    timeStamp: DateFormat.MEd().format(DateTime.parse(json['timeStamp'])),
    hash: json['hash'] ?? '',
    nonce: json['nonce'] ?? '',
    blockHash: json['blockHash'] ?? '',
    transactionIndex: json['transactionIndex'] ?? '',
    from: json['from'] ?? '',
    to: json['to'] ?? '',
    value: (double.tryParse(json['value'])! / pow(10, 18)).toStringAsFixed(3),
    gas: (double.tryParse(json['gas'])! / pow(10, 18)).toStringAsFixed(3),
    gasPrice: json['gasPrice'] ?? '',
    isError: json['isError'] ?? '',
    txreceiptStatus: json['txreceipt_status'] ?? '',
    input: json['input'] ?? '',
    contractAddress: json['contractAddress'] ?? '',
    cumulativeGasUsed: json['cumulativeGasUsed'] ?? '',
    gasUsed: json['gasUsed'] ?? '',
    confirmations: json['confirmations'] ?? '',
    methodId: json['methodId'] ?? '',
    functionName: json['functionName'] ?? '',
  );

  Map<String, dynamic> toMap() => {
    'blockNumber': blockNumber,
    'timeStamp': timeStamp,
    'hash': hash,
    'nonce': nonce,
    'blockHash': blockHash,
    'transactionIndex': transactionIndex,
    'from': from,
    'to': to,
    'value': value,
    'gas': gas,
    'gasPrice': gasPrice,
    'isError': isError,
    'txreceipt_status': txreceiptStatus,
    'input': input,
    'contractAddress': contractAddress,
    'cumulativeGasUsed': cumulativeGasUsed,
    'gasUsed': gasUsed,
    'confirmations': confirmations,
    'methodId': methodId,
    'functionName': functionName,
  };
}
