import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kalshi/core/di/injection.config.dart';

@module
abstract class RegisterModule {}

class $RegisterModule extends RegisterModule {}

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
