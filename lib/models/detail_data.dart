import 'package:equatable/equatable.dart';

import '../dto/history_item_dto.dart';
import 'asset.dart';

class DetailData extends Equatable {
  final Asset asset;
  final List<HistoryItemDto> graphData;

  const DetailData({
    required this.asset,
    required this.graphData,
  });

  factory DetailData.fromJson(Map<String, dynamic> json) {
    return DetailData(
      asset: json['assetUI'] as Asset,
      graphData: json['graphData'] as List<HistoryItemDto>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'assetUI': asset,
      'graphData': graphData,
    };
  }

  @override
  List<Object?> get props => [asset, graphData];
}
