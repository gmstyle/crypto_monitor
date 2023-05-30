import 'dart:convert';

import 'package:crypto_monitor/dto/asset_dto.dart';
import 'package:crypto_monitor/mappers/asset_mapper.dart';
import 'package:crypto_monitor/models/asset.dart';

import '../dto/api_response_dto.dart';
import '../providers/api_provider.dart';

class HomeRepository {
  final ApiProvider apiProvider;
  final AssetMapper assetMapper;

  HomeRepository({required this.apiProvider, required this.assetMapper});

  Future<List<Asset>> getAssets(String? key) async {
    try {
      final response = await apiProvider.getAssets(key);
      var decode = jsonDecode(response.body) as Map<String, dynamic>;
      final apiResponse = ApiResponseDto.fromJson(decode);

      final assetsDto = (apiResponse.data as List<dynamic>)
          .map((e) => AssetDto.fromJson(e as Map<String, dynamic>))
          .toList();
      final assets = List<Asset>.empty(growable: true);
      for (AssetDto dto in assetsDto) {
        assets.add(assetMapper.mapToModel(dto));
      }

      return assets;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
