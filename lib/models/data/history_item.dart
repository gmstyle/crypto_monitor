import 'package:equatable/equatable.dart';

class HistoryItem extends Equatable {
  final String priceUsd;
  final int time;
  final String? circulatingSupply;
  final String? date;

  const HistoryItem({
    required this.priceUsd,
    required this.time,
    required this.circulatingSupply,
    required this.date,
  });

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      priceUsd: json['priceUsd'] as String,
      time: json['time'] as int,
      circulatingSupply: json['circulatingSupply'] as String?,
      date: json['date'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'priceUsd': priceUsd,
      'time': time,
      'circulatingSupply': circulatingSupply,
      'date': date,
    };
  }

  @override
  List<Object?> get props => [priceUsd, time];
}
