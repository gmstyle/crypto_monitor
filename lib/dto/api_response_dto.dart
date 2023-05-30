import 'package:equatable/equatable.dart';

class ApiResponseDto extends Equatable {
  final dynamic data;
  final int timestamp;

  const ApiResponseDto({
    required this.data,
    required this.timestamp,
  });

  factory ApiResponseDto.fromJson(Map<String, dynamic> json) {
    return ApiResponseDto(
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
