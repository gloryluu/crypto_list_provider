import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:crypto_app_provider/core/models/crypto_model.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
///   // A function that converts a response body into a List<Crypto>.
  List _parseCryptos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Crypto>((json) => Crypto.fromJson(json)).toList();
  }

class Api {
  static const endpoint = 'https://api.coingecko.com/api/v3';

  var client = new http.Client();

  Future fetchCoins() async {
    final response = await client.get('$endpoint/coins');
    
    // Use the compute function to run parsePhotos in a separate isolate.
    return compute(_parseCryptos, response.body);
  }

  Future fetchCoinById(String id) async {
    final response = await client.get('$endpoint/coins/$id');

    return json.decode(response.body);
  }
}
