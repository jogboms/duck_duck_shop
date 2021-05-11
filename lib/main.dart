import 'package:duck_duck_shop/registry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'data.dart';
import 'repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  final navigatorKey = GlobalKey<NavigatorState>();

  final firebase = await Firebase.initialize();
  final repository = Repository(
    auth: AuthImpl(firebase: firebase),
    items: ItemsImpl(firebase: firebase),
  );

  Registry().initialize(repository, navigatorKey);

  runApp(App());
}
