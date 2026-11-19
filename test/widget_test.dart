import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:taskflow/app/taskflow_app.dart';
import 'package:taskflow/features/tasks/data/local_task_repository.dart';
import 'package:taskflow/features/tasks/presentation/tasks_view_model.dart';

void main() {
  testWidgets('TaskFlow muestra las cinco tareas', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider<TasksViewModel>(
        create: (_) => TasksViewModel(LocalTaskRepository()),
        child: const TaskFlowApp(),
      ),
    );

    expect(find.text('Mis tareas'), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(5));
    expect(find.text('Diseñar interfaz de TaskFlow'), findsOneWidget);
  });
}
