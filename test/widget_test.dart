import 'package:duck_duck_shop/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(App());

    expect(find.text('Hello world'), findsOneWidget);
  });
}
