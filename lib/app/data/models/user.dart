import 'dart:convert';

class UserResponse {
  String status;
  String message;
  UData data;

  UserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  UserResponse copyWith({
    String? status,
    String? message,
    UData? data,
  }) {
    return UserResponse(
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

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      data: UData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponse.fromJson(String source) =>
      UserResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserResponse(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserResponse &&
        other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class UData {
  String phoneNumber;
  String created;
  UData({
    required this.phoneNumber,
    required this.created,
  });

  UData copyWith({
    String? phoneNumber,
    String? created,
  }) {
    return UData(
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

  factory UData.fromMap(Map<String, dynamic> map) {
    return UData(
      phoneNumber: map['phoneNumber'] ?? '',
      created: map['created'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UData.fromJson(String source) => UData.fromMap(json.decode(source));

  @override
  String toString() => 'UData(phoneNumber: $phoneNumber, created: $created)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UData &&
        other.phoneNumber == phoneNumber &&
        other.created == created;
  }

  @override
  int get hashCode => phoneNumber.hashCode ^ created.hashCode;
}
