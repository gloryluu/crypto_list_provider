import 'package:crypto_app_provider/core/models/fav_crypto_model.dart';
import 'package:crypto_app_provider/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import '../../core/enums/viewstate.dart';
import '../../ui/views/base_view.dart';
import '../../core/viewmodels/cryptos_view_model.dart';

class CryptoListView extends StatefulWidget {
  CryptoListView({Key key}) : super(key: key);

  @override
  CryptoListViewState createState() => CryptoListViewState();
}

class CryptoListViewState extends State<CryptoListView>
    with AutomaticKeepAliveClientMixin {
  CryptoViewModel _model;

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<CryptoViewModel>(
      onModelReady: (model) {
        _model = model;
        model.fetchCoins();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Crypto List'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              highlightColor: Colors.white,
              onPressed: () => _pushSaved(context),
            )
          ],
        ),
        body: _buildMainBody(model),
      ),
    );
  }

  Widget _buildMainBody(CryptoViewModel model) {
    if (model.state == ViewState.Loading) {
      return Center(child: CircularProgressIndicator());
    } else if (model.state == ViewState.Loaded) {
      return RefreshIndicator(
        child: _buildCryptoList(model.cryptos),
        onRefresh: model.fetchCoins,
      );
    } else if (model.state == ViewState.Empty) {
      return Center(child: Text('Empty'));
    } else if (model.state == ViewState.Error) {
      return Center(child: Text('Error'));
    }
    return null;
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
    // Get index matching with saved item
    // And restore the saved
    // To keep the index after refresh
    final saved = Set<Map>.from(Provider.of<FavouriteCryptoListModel>(context)
        .saved
        .map(
            (saved) => _model.cryptos.indexWhere((l) => l['id'] == saved['id']))
        .map((index) => _model.cryptos[index]));
    Provider.of<FavouriteCryptoListModel>(context)
        .saved
        .clear(); // Clear saved item
    Provider.of<FavouriteCryptoListModel>(context).saved.addAll(saved);

    final bool favourited =
        Provider.of<FavouriteCryptoListModel>(context).saved.contains(crypto);

    void _fav() {
      if (favourited) {
        //if it is favourited previously, remove it from the list
        // _model.removeCryptoFromFav(crypto);
        Provider.of<FavouriteCryptoListModel>(context).remove(crypto);
      } else {
        Provider.of<FavouriteCryptoListModel>(context)
            .addItem(crypto); //else add it to the array
      }
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
        icon: Icon(favourited ? Icons.favorite : Icons.favorite_border),
        color: Colors.red,
        onPressed: _fav,
      ),
    );
  }

  _pushSaved(BuildContext context) {
    Navigator.pushNamed(context, 'fav');
  }
}
