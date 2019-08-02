import 'package:crypto_app_provider/core/models/fav_crypto_model.dart';
import 'package:crypto_app_provider/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class FavoriteCryptoListView extends StatelessWidget {
  FavoriteCryptoListView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _buildCryptoList(
            Provider.of<FavouriteCryptoListModel>(context).saved.toList()));
  }

  Widget _buildCryptoList(List cryptos) {
    return ListView.builder(
      padding: const EdgeInsets.all(0.0),
      itemCount: cryptos.length,
      itemBuilder: (context, index) {
        final MaterialColor color = colors[index % colors.length];
        return _buildRow(context, cryptos[index], color);
      },
    );
  }

  String _cryptoPrice(Map crypto) {
    int decimals = 2;
    int fac = pow(10, decimals);
    double d = double.parse(crypto['price_usd']);
    return "\$" + (d = (d * fac).round() / fac).toString();
  }

  Widget _buildRow(BuildContext context, Map crypto, MaterialColor color) {
    void _fav() {
      Provider.of<FavouriteCryptoListModel>(context).remove(crypto);
    }

    Future<void> _showAlert(BuildContext context) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //title: Text('Remove this item'),
            content: const Text('Do you want to remove this item ?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  _fav();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
    }

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
        icon: Icon(Icons.favorite),
        color: Colors.red,
        onPressed: () => _showAlert(context),
      ),
    );
  }
}
