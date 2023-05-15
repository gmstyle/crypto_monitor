import 'package:equatable/equatable.dart';

class AssetUI extends Equatable {
  final String? id;
  final String? rank;
  final String? symbol;
  final String? name;
  final String? supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final String? priceUsd;
  final String? changePercent24Hr;
  final String? vwap24Hr;
  final String? imgageUrl;

  const AssetUI({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    required this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    required this.vwap24Hr,
    required this.imgageUrl,
  });

  factory AssetUI.fromJson(Map<String, dynamic> json) {
    return AssetUI(
      id: json['id'] as String?,
      rank: json['rank'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      supply: json['supply'] as String?,
      maxSupply: json['maxSupply'] as String?,
      marketCapUsd: json['marketCapUsd'] as String?,
      volumeUsd24Hr: json['volumeUsd24Hr'] as String?,
      priceUsd: json['priceUsd'] as String?,
      changePercent24Hr: json['changePercent24Hr'] as String?,
      vwap24Hr: json['vwap24Hr'] as String?,
      imgageUrl: json['imgageUrl'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        id,
        rank,
        symbol,
        name,
        supply,
        maxSupply,
        marketCapUsd,
        volumeUsd24Hr,
        priceUsd,
        changePercent24Hr,
        vwap24Hr,
        imgageUrl
      ];
}
