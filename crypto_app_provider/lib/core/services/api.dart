import 'dart:convert';

import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const endpoint = 'https://api.coinmarketcap.com/v1/';

  var client = new http.Client();

  Future fetchCoins() async {
    // Get user profile for id
    var response = await client.get('$endpoint/ticker/');

    return json.decode(response.body);
  }
}
