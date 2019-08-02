import '../../locator.dart';
import '../../core/enums/viewstate.dart';
import '../services/crypto_service.dart';
import 'base_model.dart';

class CryptoViewModel extends BaseModel {
  CryptoService _cryptoService = locator<CryptoService>();

  List get cryptos => _cryptoService.cryptos;

  List _searchResult = [];
  List get searchResult => _searchResult;

  bool _isSearching = false;
  bool get isSearching => _isSearching;

  void setSearching(bool value) {
    _isSearching = value;
    notifyListeners();
  }

  Future filterCoins(String query) async {
    _searchResult = query.isEmpty ? [] : cryptos.where((l) => l['name'].toString().contains(query)).toList();
    notifyListeners();
  }

  Future fetchCoins() async {
    cryptos != null ?? setState(ViewState.Loading);
    await _cryptoService.fetchCoins();
    setState(cryptos.length > 0 ? ViewState.Loaded : ViewState.Empty);
  }
}
