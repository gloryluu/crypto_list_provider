import 'package:get_it/get_it.dart';

import 'core/services/api.dart';
import 'core/services/crypto_service.dart';
import 'core/viewmodels/cryptos_view_model.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => CryptoService());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => CryptoViewModel());
}