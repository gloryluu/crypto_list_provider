import 'package:crypto_app_provider/core/models/crypto_model.dart';
import 'package:flutter/widgets.dart';

class FavouriteCryptoListModel extends ChangeNotifier {
  final saved = Set<Crypto>();

  void addItem(Crypto item) {
    saved.add(item);
    notifyListeners();
  }

  void addItems(Set<Crypto> items) {
    saved.addAll(items);
    notifyListeners();
  }

  void remove(Crypto item) {
    saved.remove(item);
    notifyListeners();
  }
}
