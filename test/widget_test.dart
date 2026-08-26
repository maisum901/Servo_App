import 'package:flutter_test/flutter_test.dart';
import 'package:servepro_app/app/app.dart';

void main() {
  testWidgets('ServePro MVC GetX app launch test', (WidgetTester tester) async {
    await tester.pumpWidget(const ServeProApp());
    await tester.pump(const Duration(seconds: 3));
    expect(find.byType(ServeProApp), findsOneWidget);
  });
}
