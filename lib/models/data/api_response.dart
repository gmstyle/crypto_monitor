import 'package:equatable/equatable.dart';

class ApiResponse extends Equatable {
  final dynamic data;
  final int timestamp;

  const ApiResponse({
    required this.data,
    required this.timestamp,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: json['data'] as dynamic,
      timestamp: json['timestamp'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'timestamp': timestamp,
    };
  }

  @override
  List<Object?> get props => [data, timestamp];
}
