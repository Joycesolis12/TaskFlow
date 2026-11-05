import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/main.dart';

void main() {
  testWidgets('TaskFlow muestra el listado local', (tester) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('Mis tareas'), findsOneWidget);

    expect(demoTasks.length, 5);

    expect(find.byType(ListView), findsOneWidget);

    expect(find.byType(TaskCard), findsWidgets);

    expect(find.text('Diseñar interfaz de TaskFlow'), findsOneWidget);
  });
}
