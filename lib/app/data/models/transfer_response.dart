import 'dart:convert';

class TransferResponse {
  String status;
  String message;
  TData data;
  TransferResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  TransferResponse copyWith({
    String? status,
    String? message,
    TData? data,
  }) {
    return TransferResponse(
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

  factory TransferResponse.fromMap(Map<String, dynamic> map) {
    return TransferResponse(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      data: TData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransferResponse.fromJson(String source) =>
      TransferResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'TransferResponse(status: $status, message: $message, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransferResponse &&
        other.status == status &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ data.hashCode;
}

class TData {
  int sent;
  TData({
    required this.sent,
  });

  TData copyWith({
    int? sent,
  }) {
    return TData(
      sent: sent ?? this.sent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sent': sent,
    };
  }

  factory TData.fromMap(Map<String, dynamic> map) {
    return TData(
      sent: map['sent']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TData.fromJson(String source) => TData.fromMap(json.decode(source));

  @override
  String toString() => 'TData(sent: $sent)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TData && other.sent == sent;
  }

  @override
  int get hashCode => sent.hashCode;
}
