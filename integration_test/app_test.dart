import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hospital_guider/app.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group('App', () {
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
    testWidgets(
      'Test Launching App',
      (WidgetTester tester) async {
        await tester.pumpWidget(const RootApp());
        expect(
          find.text('Đăng ký khám bệnh online'),
          findsOneWidget,
        );
      },
    );
    testWidgets('Test Selecting Date', (WidgetTester tester) async {
      await tester.pumpWidget(const RootApp());
      await tester.tap(
        find.byKey(
          const ValueKey('select_date'),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('SELECT DATE'), findsOneWidget);

      await tester.tap(
        find.text('21'),
      );
      await tester.pumpAndSettle();

      await tester.tap(
        find.widgetWithText(TextButton, 'OK'),
      );
      await tester.pumpAndSettle();
      expect(
        find.textContaining('21/5/2022'),
        findsOneWidget,
      );
    });
    testWidgets('Test Select Time', (WidgetTester tester) async {
      await tester.pumpWidget(const RootApp());
      await tester.tap(find.byKey(
        const ValueKey('select_hour'),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Giờ có thể đăng ký khám'), findsOneWidget);
      await tester.tap(find.byKey(
        const ValueKey('time-0'),
     
      ));
       await tester.pumpAndSettle();
       expect(find.textContaining('0:15'), findsOneWidget);
    });
  });
}
