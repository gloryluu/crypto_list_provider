import 'dart:convert';

import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const endpoint = 'https://api.coinmarketcap.com/v1/';

  var client = new http.Client();

  Future<List> fetchCoins() async {
    // Get user profile for id
    var response = await client.get('$endpoint/ticker/');

    // Convert and return
    return json.decode(response.body);
  }
}
