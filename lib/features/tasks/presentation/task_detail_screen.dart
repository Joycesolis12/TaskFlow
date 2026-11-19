import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'tasks_view_model.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key, required this.taskId});

  final int? taskId;

  @override
  Widget build(BuildContext context) {
    final task = context.watch<TasksViewModel>().findTask(taskId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de tarea'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: task == null
            ? const Center(child: Text('No se encontró esta tarea.'))
            : ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(task.description),
                  const SizedBox(height: 16),
                  Chip(label: Text('Prioridad: ${task.priority}')),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        task.isCompleted
                            ? Icons.check_circle
                            : Icons.pending_actions,
                        color: task.isCompleted ? Colors.green : Colors.orange,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        task.isCompleted
                            ? 'Estado: completada'
                            : 'Estado: pendiente',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          const Icon(Icons.person_outline),
                          const SizedBox(width: 12),
                          Text('Usuario: ${task.userId}'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {
                      context.read<TasksViewModel>().toggleCompleted(task.id);
                    },
                    child: Text(
                      task.isCompleted
                          ? 'Marcar como pendiente'
                          : 'Marcar como completada',
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Volver al listado'),
                  ),
                ],
              ),
      ),
    );
  }
}
