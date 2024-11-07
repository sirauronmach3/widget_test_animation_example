import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_animation_example/animation_screen.dart';

void main() {
  testWidgets('Animation Screen Test', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AnimationScreen(),
      ),
    );

    var containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);
    var container = tester.widget<Container>(containerFinder);

    // Initial
    expect(container.constraints!.maxWidth, 50);
    expect(container.constraints!.maxHeight, 50);
    expect((container.decoration as BoxDecoration).color, Colors.blue);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.zero);

    // Wait for animation
    await tester.pumpAndSettle();
    containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);
    container = tester.widget<Container>(containerFinder);

    // Final
    expect(container.constraints!.maxWidth, 200);
    expect(container.constraints!.maxHeight, 200);
    expect((container.decoration as BoxDecoration).color, Colors.green);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.circular(50));
  });
}
