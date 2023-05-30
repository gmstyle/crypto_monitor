import 'package:crypto_monitor/dto/asset_dto.dart';
import 'package:crypto_monitor/mappers/base_mapper.dart';
import 'package:crypto_monitor/models/asset.dart';

class AssetMapper extends BaseMapper<AssetDto, Asset> {
  @override
  AssetDto mapToDto(Asset model) {
    return AssetDto(
      id: model.id,
      name: model.name,
      symbol: model.symbol,
      rank: model.rank,
      supply: model.supply,
      maxSupply: model.maxSupply,
      marketCapUsd: model.marketCapUsd,
      volumeUsd24Hr: model.volumeUsd24Hr,
      priceUsd: model.priceUsd,
      changePercent24Hr: model.changePercent24Hr,
      vwap24Hr: model.vwap24Hr,
    );
  }

  @override
  Asset mapToModel(AssetDto data) {
    return Asset(
      id: data.id,
      name: data.name,
      symbol: data.symbol,
      rank: data.rank,
      supply: data.supply,
      maxSupply: data.maxSupply,
      marketCapUsd: data.marketCapUsd,
      volumeUsd24Hr: data.volumeUsd24Hr,
      priceUsd: data.priceUsd,
      changePercent24Hr: data.changePercent24Hr,
      vwap24Hr: data.vwap24Hr,
      imgageUrl:
          'https://assets.coincap.io/assets/icons/${data.symbol?.toLowerCase()}@2x.png',
    );
  }
}
