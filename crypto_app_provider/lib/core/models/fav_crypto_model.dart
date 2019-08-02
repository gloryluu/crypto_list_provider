import 'package:flutter/widgets.dart';

class FavouriteCryptoListModel extends ChangeNotifier {
  final saved = Set<Map>();

  void addItem(Map item) {
    saved.add(item);
    notifyListeners();
  }

  void addItems(Set<Map> items) {
    saved.addAll(items);
    notifyListeners();
  }

  void remove(Map item) {
    saved.remove(item);
    notifyListeners();
  }
}
