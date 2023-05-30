import 'dart:convert';

import 'package:crypto_monitor/dto/history_item_dto.dart';
import 'package:crypto_monitor/models/detail_data.dart';

import '../blocs/detail/detail_bloc.dart';
import '../dto/api_response_dto.dart';
import '../dto/asset_dto.dart';
import '../mappers/asset_mapper.dart';
import '../models/asset.dart';
import '../providers/api_provider.dart';

class DetailRepository {
  final ApiProvider apiProvider;
  final AssetMapper assetMapper;

  DetailRepository({required this.apiProvider, required this.assetMapper});

  Future<DetailData> getDetailDataById(
      String id, HistoryInterval interval) async {
    try {
      final assetUI = await _getAssetById(id);
      final graphData = await _getAssetHistoryById(id, interval);
      return DetailData(asset: assetUI, graphData: graphData);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<Asset> _getAssetById(String id) async {
    try {
      final response = await apiProvider.getAssetById(id);
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      final apiResponse = ApiResponseDto.fromJson(decode);
      final dto = AssetDto.fromJson(apiResponse.data as Map<String, dynamic>);
      return assetMapper.mapToModel(dto);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<HistoryItemDto>> _getAssetHistoryById(
      String id, HistoryInterval interval) async {
    try {
      final response = await apiProvider.getAssetHistoryById(id, interval);
      final decode = jsonDecode(response.body) as Map<String, dynamic>;
      final apiResponse = ApiResponseDto.fromJson(decode);
      final history = (apiResponse.data as List<dynamic>)
          .map((e) => HistoryItemDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return history;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
