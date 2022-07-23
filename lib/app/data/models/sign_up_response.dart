import 'dart:convert';

class RegisterationResponse {
  String status;
  String message;
  RData data;
  RegisterationResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  RegisterationResponse copyWith({
    String? status,
    String? message,
    RData? data,
  }) {
    return RegisterationResponse(
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

  factory RegisterationResponse.fromMap(Map<String, dynamic> map) {
    return RegisterationResponse(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      data: RData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterationResponse.fromJson(String source) =>
      RegisterationResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'RegisterationResponse(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterationResponse &&
        other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class RData {
  String phoneNumber;
  String created;
  RData({
    required this.phoneNumber,
    required this.created,
  });

  RData copyWith({
    String? phoneNumber,
    String? created,
  }) {
    return RData(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phoneNumber': phoneNumber,
      'created': created,
    };
  }

  factory RData.fromMap(Map<String, dynamic> map) {
    return RData(
      phoneNumber: map['phoneNumber'] ?? '',
      created: map['created'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RData.fromJson(String source) => RData.fromMap(json.decode(source));

  @override
  String toString() => 'RData(phoneNumber: $phoneNumber, created: $created)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RData &&
        other.phoneNumber == phoneNumber &&
        other.created == created;
  }

  @override
  int get hashCode => phoneNumber.hashCode ^ created.hashCode;
}
