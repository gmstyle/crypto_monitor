import 'package:http/http.dart' as http;

import '../blocs/detail/detail_bloc.dart';

class ApiProvider {
  Future<http.Response> getAssets(String? key) async {
    try {
      final response = await http.get(
          Uri.parse('https://api.coincap.io/v2/assets?search=${key ?? ''}'));
      if (response.statusCode == 200) {
        return response;
      } else {
        return Future.error(Exception('Errore nel caricamento degli asset'));
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<http.Response> getAssetById(String id) async {
    try {
      final response =
          await http.get(Uri.parse('https://api.coincap.io/v2/assets/$id'));
      if (response.statusCode == 200) {
        return response;
      } else {
        return Future.error(Exception('Errore nel caricamento degli asset'));
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<http.Response> getAssetHistoryById(
      String id, HistoryInterval interval) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.coincap.io/v2/assets/$id/history?interval=${interval.name}'));
      if (response.statusCode == 200) {
        return response;
      } else {
        return Future.error(Exception('Errore nel caricamento degli asset'));
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
