import 'package:crypto_app_provider/ui/views/crypto_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:crypto_app_provider/ui/views/tabbar_view.dart';
import 'package:crypto_app_provider/ui/views/cryto_view.dart';
import 'package:crypto_app_provider/ui/views/crypto_fav_view.dart';

const String initialRoute = "/";

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => TabbarView(title: 'Bottom Navigation'));
      case 'list':
        return MaterialPageRoute(builder: (_) => CryptoListView());
      case 'detail':
        return MaterialPageRoute(builder: (_) => CryptoDetailView());
      case 'fav':
        return MaterialPageRoute(
            builder: (_) => FavoriteCryptoListView(
                  title: 'My Favorite',
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
