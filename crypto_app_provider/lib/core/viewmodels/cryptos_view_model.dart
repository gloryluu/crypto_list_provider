import '../../locator.dart';
import '../../core/enums/viewstate.dart';
import '../services/crypto_service.dart';
import 'base_model.dart';

class CryptoViewModel extends BaseModel {
  CryptoService _cryptoService = locator<CryptoService>();

  List get cryptos => _cryptoService.cryptos;
  final saved = Set<Map>();

  Future fetchCoins() async {
    cryptos != null ?? setState(ViewState.Loading);
    await _cryptoService.fetchCoins();
    setState(cryptos.length > 0 ? ViewState.Loaded : ViewState.Empty);
  }

  void addCryptoToFav(Map item) {
    saved.add(item);
    notifyListeners();
  }

  void addCryptosToFav(Set<Map> items) {
    saved.addAll(items);
    notifyListeners();
  }

  void removeCryptoFromFav(Map item) {
    saved.remove(item);
    notifyListeners();
  }
}
