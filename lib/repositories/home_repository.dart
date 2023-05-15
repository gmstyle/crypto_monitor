import 'dart:convert';

import 'package:crypto_monitor/models/data/asset.dart';
import 'package:crypto_monitor/models/ui/assetUI.dart';

import '../models/data/api_response.dart';
import '../providers/api_provider.dart';

class HomeRepository {
  final ApiProvider apiProvider;

  HomeRepository({required this.apiProvider});

  Future<List<AssetUI>> getAssets(String? key) async {
    try {
      final response = await apiProvider.getAssets(key);
      var decode = jsonDecode(response.body) as Map<String, dynamic>;
      final apiResponse = ApiResponse.fromJson(decode);
      final assets = (apiResponse.data as List<dynamic>)
          .map((e) => Asset.fromJson(e as Map<String, dynamic>))
          .toList();
      final assetsUI = List<AssetUI>.empty(growable: true);
      for (Asset asset in assets) {
        assetsUI.add(AssetUI(
            id: asset.id,
            name: asset.name,
            symbol: asset.symbol,
            rank: asset.rank,
            supply: asset.supply,
            maxSupply: asset.maxSupply,
            marketCapUsd: asset.marketCapUsd,
            volumeUsd24Hr: asset.volumeUsd24Hr,
            priceUsd: asset.priceUsd,
            changePercent24Hr: asset.changePercent24Hr,
            vwap24Hr: asset.vwap24Hr,
            imgageUrl:
                'https://assets.coincap.io/assets/icons/${asset.symbol?.toLowerCase()}@2x.png'));
      }

      return assetsUI;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
