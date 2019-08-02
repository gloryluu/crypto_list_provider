import 'dart:convert';

import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const endpoint = 'https://api.coinmarketcap.com/v1/';

  var client = new http.Client();

  Future fetchCoins() async {
    var response = await client.get('$endpoint/ticker/');

    return json.decode(response.body);
  }

    Future fetchCoinById(String id) async {
    var response = await client.get('$endpoint/ticker/$id');

    return json.decode(response.body);
  }
}
