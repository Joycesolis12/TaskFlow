import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:taskflow/main.dart';

void main() {
  testWidgets('TaskFlow permite gestionar tareas', (WidgetTester tester) async {
    // Abrir nuestra aplicación.
    await tester.pumpWidget(const TaskFlowApp());

    // Comprobar los valores iniciales.
    expect(find.text('Tareas pendientes: 3'), findsOneWidget);
    expect(find.text('Completadas hoy: 0 de 5'), findsOneWidget);

    // Agregar una tarea.
    await tester.tap(find.text('Agregar tarea'));
    await tester.pump();

    expect(find.text('Tareas pendientes: 4'), findsOneWidget);

    // Completar una tarea.
    await tester.tap(find.text('Completar una tarea'));
    await tester.pump();

    expect(find.text('Tareas pendientes: 3'), findsOneWidget);
    expect(find.text('Completadas hoy: 1 de 5'), findsOneWidget);

    // Comprobar que existe el botón de completar.
    expect(find.byIcon(Icons.done), findsOneWidget);
  });
}
