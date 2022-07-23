import 'dart:convert';

class WithdrawResponse {
  String status;
  String message;
  WData data;
  WithdrawResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  WithdrawResponse copyWith({
    String? status,
    String? message,
    WData? data,
  }) {
    return WithdrawResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data.toMap(),
    };
  }

  factory WithdrawResponse.fromMap(Map<String, dynamic> map) {
    return WithdrawResponse(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      data: WData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WithdrawResponse.fromJson(String source) =>
      WithdrawResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'WithdrawResponse(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WithdrawResponse &&
        other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class WData {
  int withdrawal;
  WData({
    required this.withdrawal,
  });

  WData copyWith({
    int? withdrawal,
  }) {
    return WData(
      withdrawal: withdrawal ?? this.withdrawal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'withdrawal': withdrawal,
    };
  }

  factory WData.fromMap(Map<String, dynamic> map) {
    return WData(
      withdrawal: map['withdrawal']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WData.fromJson(String source) => WData.fromMap(json.decode(source));

  @override
  String toString() => 'WData(withdrawal: $withdrawal)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WData && other.withdrawal == withdrawal;
  }

  @override
  int get hashCode => withdrawal.hashCode;
}
