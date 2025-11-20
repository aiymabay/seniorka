// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';

import 'package:seniorka/main.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const SmartNavApp());

    expect(find.text('Campus Map'), findsOneWidget);
  });
}
