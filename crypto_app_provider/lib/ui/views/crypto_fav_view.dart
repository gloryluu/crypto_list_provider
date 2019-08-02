import 'package:crypto_app_provider/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../core/enums/viewstate.dart';
import '../../ui/views/base_view.dart';
import '../../core/viewmodels/cryptos_view_model.dart';

class FavoriteCryptoListPage extends StatelessWidget {
  FavoriteCryptoListPage({Key key, this.title}) : super(key: key);

  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _buildCryptoList(Provider.of<Set<Map>>(context).toList()));
  }

  Widget _buildCryptoList(List cryptos) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: cryptos.length,
      itemBuilder: (context, index) {
        final MaterialColor color = colors[index % colors.length];
        return _buildRow(cryptos[index], color);
      },
    );
  }

  String _cryptoPrice(Map crypto) {
    int decimals = 2;
    int fac = pow(10, decimals);
    double d = double.parse(crypto['price_usd']);
    return "\$" + (d = (d * fac).round() / fac).toString();
  }

  Widget _buildRow(Map crypto, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(crypto['name'][0]),
      ),
      title: Text(crypto['name']),
      subtitle: Text(
        _cryptoPrice(crypto),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        icon: Icon(Icons.favorite_border),
        color: Colors.red,
        onPressed: null,
      ),
    );
  }
}
