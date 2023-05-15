import 'package:equatable/equatable.dart';

import '../data/history_item.dart';
import 'assetUI.dart';

class DetailDataUI extends Equatable {
  final AssetUI assetUI;
  final List<HistoryItem> graphData;

  const DetailDataUI({
    required this.assetUI,
    required this.graphData,
  });

  factory DetailDataUI.fromJson(Map<String, dynamic> json) {
    return DetailDataUI(
      assetUI: json['assetUI'] as AssetUI,
      graphData: json['graphData'] as List<HistoryItem>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'assetUI': assetUI,
      'graphData': graphData,
    };
  }

  @override
  List<Object?> get props => [assetUI, graphData];
}
