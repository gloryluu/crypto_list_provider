import 'package:crypto_app_provider/core/enums/connectivity_status.dart';
import 'package:crypto_app_provider/core/models/fav_crypto_model.dart';
import 'package:crypto_app_provider/core/services/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:core';
import 'locator.dart';
import 'ui/router.dart';
import 'ui/shared/app_theme.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<FavouriteCryptoListModel>(
              builder: (context) => FavouriteCryptoListModel()),
          StreamProvider<ConnectivityStatus>.controller(
              builder: (context) =>
                  ConnectivityService().connectionStatusController),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: appTheme,
          initialRoute: '/',
          onGenerateRoute: Router.generateRoute,
        ));
  }
}
