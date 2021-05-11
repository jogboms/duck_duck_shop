import 'package:flutter/cupertino.dart';

import 'domain.dart';

class Repository {
  const Repository({@required this.auth, @required this.items});

  final AuthRepository auth;
  final ItemsRepository items;
}
