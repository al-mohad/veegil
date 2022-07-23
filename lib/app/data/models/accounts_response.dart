import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:veegil/app/data/models/account.dart';

class AccountsResponse {
  String status;
  String message;
  List<Account> data;
  AccountsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  AccountsResponse copyWith({
    String? status,
    String? message,
    List<Account>? data,
  }) {
    return AccountsResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory AccountsResponse.fromMap(Map<String, dynamic> map) {
    return AccountsResponse(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      data: List<Account>.from(map['data']?.map((x) => Account.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountsResponse.fromJson(String source) =>
      AccountsResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'AccountsResponse(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccountsResponse &&
        other.status == status &&
        other.message == message &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}
