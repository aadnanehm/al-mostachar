import 'package:flutter_test/flutter_test.dart';

import 'package:al_mostachar/main.dart';

void main() {
  testWidgets('App starts and shows the bottom navigation', (tester) async {
    await tester.pumpWidget(const MostacharApp());
    expect(find.byType(RootScreen), findsOneWidget);
  });
}
