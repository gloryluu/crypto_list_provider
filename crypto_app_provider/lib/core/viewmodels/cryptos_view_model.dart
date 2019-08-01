import '../../locator.dart';
import '../../core/enums/viewstate.dart';
import '../services/crypto_service.dart';
import 'base_model.dart';

class CryptoViewModel extends BaseModel {
  CryptoService _cryptoService = locator<CryptoService>();

  List get cryptos => _cryptoService.cryptos;

  Future fetchCoins() async {
    setState(ViewState.Loading);
    await _cryptoService.fetchCoins();
    setState(ViewState.Loaded);
  }
}