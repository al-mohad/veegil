import 'dart:convert';

class Transaction {
  String type;
  int amount;
  String phoneNumber;
  String created;
  Transaction({
    required this.type,
    required this.amount,
    required this.phoneNumber,
    required this.created,
  });

  Transaction copyWith({
    String? type,
    int? amount,
    String? phoneNumber,
    String? created,
  }) {
    return Transaction(
      type: type ?? this.type,
      amount: amount ?? this.amount,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'amount': amount,
      'phoneNumber': phoneNumber,
      'created': created,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      type: map['type'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
      phoneNumber: map['phoneNumber'] ?? '',
      created: map['created'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Transaction(type: $type, amount: $amount, phoneNumber: $phoneNumber, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.type == type &&
        other.amount == amount &&
        other.phoneNumber == phoneNumber &&
        other.created == created;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        amount.hashCode ^
        phoneNumber.hashCode ^
        created.hashCode;
  }
}
