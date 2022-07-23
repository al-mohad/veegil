import 'dart:convert';

class Account {
  String phoneNumber;
  int balance;
  String created;
  Account({
    required this.phoneNumber,
    required this.balance,
    required this.created,
  });

  Account copyWith({
    String? phoneNumber,
    int? balance,
    String? created,
  }) {
    return Account(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      balance: balance ?? this.balance,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'balance': balance,
      'created': created,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      phoneNumber: map['phoneNumber'] ?? '',
      balance: map['balance']?.toInt() ?? 0,
      created: map['created'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));

  @override
  String toString() =>
      'Account(phoneNumber: $phoneNumber, balance: $balance, created: $created)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Account &&
        other.phoneNumber == phoneNumber &&
        other.balance == balance &&
        other.created == created;
  }

  @override
  int get hashCode =>
      phoneNumber.hashCode ^ balance.hashCode ^ created.hashCode;
}
