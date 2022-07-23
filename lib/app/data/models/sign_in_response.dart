import 'dart:convert';

class SignInResponse {
  String status;
  String message;
  LData data;
  SignInResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  SignInResponse copyWith({
    String? status,
    String? message,
    LData? data,
  }) {
    return SignInResponse(
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

  factory SignInResponse.fromMap(Map<String, dynamic> map) {
    return SignInResponse(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      data: LData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SignInResponse.fromJson(String source) =>
      SignInResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'SignInResponse(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignInResponse &&
        other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class LData {
  String token;
  LData({
    required this.token,
  });

  LData copyWith({
    String? token,
  }) {
    return LData(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory LData.fromMap(Map<String, dynamic> map) {
    return LData(
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LData.fromJson(String source) => LData.fromMap(json.decode(source));

  @override
  String toString() => 'LData(token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LData && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
