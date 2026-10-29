
import 'package:flutter/material.dart';

void main() {
  runApp(const TaskFlowApp());
}

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos personalizados del estudiante
    const studentName = 'Joyce Solís';
    const pendingTasks = 5;
    const courseName = 'Desarrollo de aplicaciones móviles';

    // Variable solicitada en el reto autónomo
    const motivationalMessage =
        '¡Cada tarea completada me acerca a mi meta!';

    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskFlow'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icono personalizado del reto
            const Icon(
              Icons.rocket_launch,
              size: 64,
              color: Colors.indigo,
            ),

            const SizedBox(height: 24),

            // Saludo personalizado
            Text(
              '¡Hola, $studentName!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 12),

            // Mensaje motivacional
            const Text(
              motivationalMessage,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(height: 16),

            // Nombre de la asignatura
            Text('Bienvenido/a a $courseName.'),

            const SizedBox(height: 32),

            // Tarjeta de tareas pendientes
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.pending_actions,
                      color: Colors.indigo,
                    ),
                    const SizedBox(width: 12),
                    Text('Tareas pendientes: $pendingTasks'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
