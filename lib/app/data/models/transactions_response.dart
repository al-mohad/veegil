import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'transaction.dart';

class TransactionsResponse {
  String status;
  List<Transaction> transactions;
  TransactionsResponse({
    required this.status,
    required this.transactions,
  });

  TransactionsResponse copyWith({
    String? status,
    List<Transaction>? transactions,
  }) {
    return TransactionsResponse(
      status: status ?? this.status,
      transactions: transactions ?? this.transactions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'data': transactions.map((x) => x.toMap()).toList(),
    };
  }

  factory TransactionsResponse.fromMap(Map<String, dynamic> map) {
    return TransactionsResponse(
      status: map['status'] ?? '',
      transactions: List<Transaction>.from(
          map['data']?.map((x) => Transaction.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionsResponse.fromJson(String source) =>
      TransactionsResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'TransactionsResponse(status: $status, transactions: $transactions)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionsResponse &&
        other.status == status &&
        listEquals(other.transactions, transactions);
  }

  @override
  int get hashCode => status.hashCode ^ transactions.hashCode;
}
