import 'package:duck_duck_shop/domain.dart';
import 'package:duck_duck_shop/registry.dart';
import 'package:duck_duck_shop/widgets.dart';
import 'package:flutter/material.dart';

import '../../coordinators.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key, @required this.isColdStart}) : super(key: key);

  final bool isColdStart;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Stream<String> _stream;
  AuthRepository _auth;

  @override
  void initState() {
    super.initState();

    _auth = Registry.di.repository.auth;
    _stream = _auth.onAuthStateChanged;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<String>(
        stream: _stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) async {
                await Coordinators.toShop(context);
              },
            );
          }

          return _Content(isColdStart: widget.isColdStart, auth: _auth);
        },
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({Key key, @required this.isColdStart, @required this.auth}) : super(key: key);

  final bool isColdStart;
  final AuthRepository auth;

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = widget.isColdStart;
    if (widget.isColdStart) {
      _onLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: null,
          bottom: 124.0,
          child: Builder(builder: (_) {
            if (isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Center(
              child: FilledButton(
                color: Colors.white,
                onPressed: _onLogin,
                child: Text(
                  'Continue with Google',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  void _onLogin() async {
    try {
      setState(() => isLoading = true);
      // TODO: move this out of here
      await widget.auth.signIn();
    } catch (e) {
      // TODO: move this out of here
      final message = e.toString();
      if (message.isNotEmpty) {
        print(message);
      }

      // TODO: move this out of here
      await widget.auth.signOut();
      if (!mounted) {
        return;
      }

      setState(() => isLoading = false);
    }
  }
}
