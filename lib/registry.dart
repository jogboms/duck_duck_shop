import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';

import 'repository.dart';

class Registry {
  const Registry();

  void initialize(
    Repository repository,
    GlobalKey<NavigatorState> navigatorKey,
  ) {
    assert(repository != null && navigatorKey != null);
    Injector.appInstance..registerSingleton<Registry>(() => this)..registerSingleton<Repository>(() => repository);
  }

  static Registry get di => Injector.appInstance.get<Registry>();

  Repository get repository => Injector.appInstance.get<Repository>();
}
