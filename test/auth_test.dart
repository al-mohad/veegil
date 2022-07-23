import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Sign Up Test', (WidgetTester tester) async {
    await tester.pumpAndSettle();
    final Finder loginButton = find.byElementType(ElevatedButton);
  });
}
