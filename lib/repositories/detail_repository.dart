import 'dart:convert';

import 'package:crypto_monitor/models/data/history_item.dart';
import 'package:crypto_monitor/models/ui/detail_dataUI.dart';

import '../blocs/detail/detail_bloc.dart';
import '../models/data/api_response.dart';
import '../models/ui/assetUI.dart';
import '../providers/api_provider.dart';

class DetailRepository {
  final ApiProvider apiProvider;

  DetailRepository({required this.apiProvider});

  Future<DetailDataUI> getDetailDataById(
      String id, HistoryInterval interval) async {
    try {
      final assetUI = await _getAssetById(id);
      final graphData = await _getAssetHistoryById(id, interval);
      return DetailDataUI(assetUI: assetUI, graphData: graphData);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<AssetUI> _getAssetById(String id) async {
    try {
      final response = await apiProvider.getAssetById(id);
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      final apiResponse = ApiResponse.fromJson(decode);
      final currency =
          AssetUI.fromJson(apiResponse.data as Map<String, dynamic>);
      return currency;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<HistoryItem>> _getAssetHistoryById(
      String id, HistoryInterval interval) async {
    try {
      final response = await apiProvider.getAssetHistoryById(id, interval);
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      final apiResponse = ApiResponse.fromJson(decode);
      final history = (apiResponse.data as List<dynamic>)
          .map((e) => HistoryItem.fromJson(e as Map<String, dynamic>))
          .toList();
      return history;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
