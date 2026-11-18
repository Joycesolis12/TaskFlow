import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'task.dart';

void main() {
  runApp(const TaskFlowApp());
}

// ============================================
// SESIÓN 5: DATOS LOCALES DE TASKFLOW
// ============================================

const List<Task> demoTasks = [
  Task(
    id: 1,
    title: 'Diseñar interfaz de TaskFlow',
    description: 'Organizar la pantalla principal de tareas',
    priority: 'Alta',
    isCompleted: true,
    userId: 1,
  ),
  Task(
    id: 2,
    title: 'Implementar modelo Task',
    description: 'Definir los datos de cada tarea',
    priority: 'Alta',
    isCompleted: true,
    userId: 1,
  ),
  Task(
    id: 3,
    title: 'Crear tarjetas reutilizables',
    description: 'Desarrollar el componente TaskCard',
    priority: 'Media',
    isCompleted: true,
    userId: 1,
  ),
  Task(
    id: 4,
    title: 'Verificar listado desplazable',
    description: 'Probar ListView.builder en Android',
    priority: 'Media',
    isCompleted: false,
    userId: 1,
  ),
  Task(
    id: 5,
    title: 'Preparar entrega de la sesión',
    description: 'Guardar evidencias y subir a GitHub',
    priority: 'Baja',
    isCompleted: false,
    userId: 1,
  ),
];

// ============================================
// BUSCAR UNA TAREA POR SU ID
// ============================================

Task? findTask(int? id) {
  for (final task in demoTasks) {
    if (task.id == id) {
      return task;
    }
  }

  return null;
}

// ============================================
// NAVEGACIÓN CON GO_ROUTER
// ============================================

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const TaskListScreen()),
    GoRoute(
      path: '/task/:id',
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '');

        return TaskDetailScreen(task: findTask(id));
      },
    ),
  ],
);

// ============================================
// APLICACIÓN PRINCIPAL
// ============================================

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'TaskFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routerConfig: appRouter,
    );
  }
}

// ============================================
// COMPONENTE REUTILIZABLE TASKCARD
// ============================================

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task, this.onTap});

  final Task task;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: task.isCompleted ? Colors.green : Colors.grey,
        ),
        title: Text(task.title),
        subtitle: Text('${task.priority} · ${task.description}'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

// ============================================
// PANTALLA PRINCIPAL: LISTADO
// ============================================

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis tareas'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: demoTasks.length,
        itemBuilder: (context, index) {
          final task = demoTasks[index];

          return TaskCard(
            task: task,
            onTap: () {
              context.push('/task/${task.id}');
            },
          );
        },
      ),
    );
  }
}

// ============================================
// SESIÓN 5: PANTALLA DE DETALLE CORREGIDA
// ============================================

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key, required this.task});

  final Task? task;

  @override
  Widget build(BuildContext context) {
    final selected = task;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de tarea'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: selected == null
            ? const Center(child: Text('No se encontró esta tarea.'))
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TÍTULO
                    Text(
                      selected.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),

                    const SizedBox(height: 16),

                    // DESCRIPCIÓN
                    Text(
                      selected.description,
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 20),

                    // PRIORIDAD
                    Chip(label: Text('Prioridad: ${selected.priority}')),

                    const SizedBox(height: 16),

                    // ESTADO
                    Row(
                      children: [
                        Icon(
                          selected.isCompleted
                              ? Icons.check_circle
                              : Icons.pending_actions,
                          color: selected.isCompleted
                              ? Colors.green
                              : Colors.orange,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          selected.isCompleted
                              ? 'Estado: completada'
                              : 'Estado: pendiente',
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // USUARIO: SESIÓN 5
                    Card(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.person_outline,
                              color: Colors.indigo,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Usuario: ${selected.userId}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Spacer(),

                    // BOTÓN PARA REGRESAR
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.tonalIcon(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                        label: const Text('Volver al listado'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
