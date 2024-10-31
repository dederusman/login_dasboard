import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_dasboard/main.dart';

void main() {
  testWidgets('Login and Dashboard Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the login page is displayed.
    expect(find.text('Login Page'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2)); // Username dan Password
    expect(find.text('Login'), findsOneWidget);

    // Enter valid username and password
    await tester.enterText(find.byType(TextField).at(0), 'user'); // Username
    await tester.enterText(find.byType(TextField).at(1), 'password'); // Password

    // Tap the login button
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle(); // Tunggu sampai navigasi selesai

    // Verify that the dashboard page is displayed
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Welcome, user!'), findsOneWidget);
  });

  testWidgets('Invalid Login Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Enter invalid username and password
    await tester.enterText(find.byType(TextField).at(0), 'wronguser'); // Username
    await tester.enterText(find.byType(TextField).at(1), 'wrongpassword'); // Password

    // Tap the login button
    await tester.tap(find.text('Login'));
    await tester.pump(); // Tunggu sampai proses login

    // Verify that the error message is displayed
    expect(find.text('Username atau password salah'), findsOneWidget);
  });
}