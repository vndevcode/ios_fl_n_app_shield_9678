import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ios_fl_n_app_shield_9678/app.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/app_back_button.dart';

/// End-to-end interaction smoke test. Runs headless via `flutter test` and
/// drives the real widget tree: loader → onboarding → tabs → forms → modals.
///
/// Asset images are not bundled in the `flutter test` environment, so image
/// decode errors are expected and ignored; every other exception fails a test.
void main() {
  bool isImageError(Object? ex) {
    final s = ex.toString().toLowerCase();
    return s.contains('unable to load asset') ||
        s.contains('image') ||
        s.contains('asset');
  }

  Future<void> usePhoneSurface(WidgetTester tester) async {
    // Render at an iPhone-sized logical viewport so full-height content and
    // bottom-anchored modal buttons are on-screen and hit-testable.
    await tester.binding.setSurfaceSize(const Size(430, 932));
    addTearDown(() => tester.binding.setSurfaceSize(null));
  }

  Future<void> settle(WidgetTester tester) async {
    // Loader repeats an animation forever, so pump fixed frames instead of
    // pumpAndSettle until we are past it.
    await tester.pump(const Duration(seconds: 4));
    await tester.pump(const Duration(milliseconds: 500));
    // Drain any expected image-load exceptions.
    final ex = tester.takeException();
    if (ex != null && !isImageError(ex)) {
      fail('Unexpected exception after settle: $ex');
    }
  }

  void expectNoRealException(WidgetTester tester) {
    final ex = tester.takeException();
    if (ex != null && !isImageError(ex)) {
      fail('Unexpected exception: $ex');
    }
  }

  testWidgets('startup → onboarding → main app navigation and requests',
      (tester) async {
    await usePhoneSurface(tester);
    await tester.pumpWidget(const NiagaraApp());
    await settle(tester);

    // Onboarding page 1.
    expect(find.text('Request Guest Services'), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);

    // Advance through onboarding: Next, Next, Get Started.
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('Use Your Visitor Pass'), findsOneWidget);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();
    expect(find.text('Explore Events and Places'), findsOneWidget);

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();
    expectNoRealException(tester);

    // Main app — Services tab is default.
    expect(find.text('Guest Services'), findsOneWidget);
    expect(find.text('Guest Services Desk'), findsWidgets);

    // Open a service request modal.
    await tester.tap(find.text('Request Support').first);
    await tester.pumpAndSettle();
    expect(find.text('Request Service'), findsOneWidget);

    // Submit empty → validation errors appear.
    await tester.tap(find.text('Submit Request'));
    await tester.pumpAndSettle();
    expect(find.text('Please enter a guest name.'), findsOneWidget);

    // Fill and submit.
    final fields = find.byType(TextField);
    await tester.enterText(fields.at(0), 'Alex Guest');
    await tester.enterText(fields.at(1), 'Today, 8:00 PM');
    await tester.pumpAndSettle();
    await tester.tap(find.text('Submit Request'));
    await tester.pumpAndSettle();

    // Confirmation modal.
    expect(find.text('Your request has been sent for review.'), findsOneWidget);
    await tester.tap(find.text('Done'));
    await tester.pumpAndSettle();

    // Open My Service Requests and verify the request is listed.
    await tester.tap(find.text('View My Service Requests'));
    await tester.pumpAndSettle();
    expect(find.text('My Service Requests'), findsOneWidget);
    expect(find.text('Alex Guest'), findsOneWidget);

    // Back to Services via the custom back button.
    await tester.tap(find.byType(AppBackButton).first);
    await tester.pumpAndSettle();
    expect(find.text('Guest Services'), findsOneWidget);
    expectNoRealException(tester);
  });

  testWidgets('bottom tabs switch across all five screens', (tester) async {
    await usePhoneSurface(tester);
    await tester.pumpWidget(const NiagaraApp());
    await settle(tester);
    await tester.tap(find.text('Skip'));
    await tester.pumpAndSettle();

    // Pass tab.
    await tester.tap(find.text('Pass'));
    await tester.pumpAndSettle();
    expect(find.text('Visitor Pass'), findsWidgets);
    expect(find.text('NRSC-4827'), findsWidgets);

    // Toggle brightness.
    await tester.tap(find.text('Increase Brightness'));
    await tester.pumpAndSettle();
    expect(find.text('Brightness On'), findsOneWidget);

    // Open fullscreen pass, then close.
    await tester.tap(find.text('Open Fullscreen'));
    await tester.pumpAndSettle();
    expect(find.text('Staff may activate full access on-site.'), findsWidgets);
    await tester.tap(find.byType(AppBackButton).first);
    await tester.pumpAndSettle();

    // Resort tab.
    await tester.tap(find.text('Resort'));
    await tester.pumpAndSettle();
    expect(find.text('Resort Places'), findsOneWidget);

    // Switch to Saved → empty state, then browse back.
    await tester.tap(find.text('Saved'));
    await tester.pumpAndSettle();
    expect(find.text('No Saved Places'), findsOneWidget);
    await tester.tap(find.text('Browse Places'));
    await tester.pumpAndSettle();

    // Events tab.
    await tester.tap(find.text('Events'));
    await tester.pumpAndSettle();
    expect(find.text('Resort Events'), findsOneWidget);
    expect(find.text('View My Event Requests'), findsOneWidget);

    // Assistant tab.
    await tester.tap(find.text('Assistant'));
    await tester.pumpAndSettle();
    expect(find.text('Guest Assistant'), findsWidgets);

    // Ask a prepared question → assistant reply appears.
    await tester.tap(find.text('How do I activate my visitor pass?').first);
    await tester.pumpAndSettle();
    expect(
      find.textContaining('Show your visitor pass to resort staff'),
      findsOneWidget,
    );
    expectNoRealException(tester);
  });
}
