import 'package:flutter/material.dart';
import 'dart:math';
import '../../core/enums/viewstate.dart';
import '../../ui/views/base_view.dart';
import '../../core/viewmodels/cryptos_view_model.dart';

class CryptoListView extends StatelessWidget {
  final List<MaterialColor> _colors = [
    //to show different colors for different cryptos
    Colors.blue,
    Colors.indigo,
    Colors.lime,
    Colors.teal,
    Colors.cyan
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<CryptoViewModel>(
      onModelReady: (model) => model.fetchCoins(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Crypto List'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              highlightColor: Colors.white,
              onPressed: () {
                _pushSaved(context);
              },
            )
          ],
        ),
        body: model.state == ViewState.Loading
            ? Center(child: CircularProgressIndicator())
            : _buildCryptoList(model.cryptos),
      ),
    );
  }

  Widget _buildBody() {
    
  }

  Widget _buildCryptoList(List cryptos) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: cryptos.length,
      itemBuilder: (context, index) {
        final MaterialColor color = _colors[index % _colors.length];
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
        onPressed: () {},
      ),
    );
  }

  _pushSaved(BuildContext context) {
    Navigator.pushNamed(context, 'fav');
  }
}
