# taskflow

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Alcance de TaskFlow

### Problema
Los estudiantes universitarios necesitan organizar sus actividades académicas, identificar las tareas pendientes y dar seguimiento a sus entregas.

### Usuario objetivo
Estudiantes universitarios que desean administrar sus tareas académicas de manera sencilla.

### Historias de usuario y criterios de aceptación

1. Como estudiante, quiero visualizar mis tareas para organizar mis actividades.
   - Criterio: la lista muestra el título, la prioridad y el estado de cada tarea.

2. Como estudiante, quiero consultar el detalle de una tarea para conocer su información.
   - Criterio: al seleccionar una tarjeta, se muestra su descripción, prioridad, estado y usuario.

3. Como estudiante, quiero crear nuevas tareas para registrar mis actividades pendientes.
   - Criterio: el formulario permite guardar una tarea válida y visualizarla en el listado.

4. Como estudiante, quiero editar mis tareas para actualizar su información.
   - Criterio: los cambios guardados aparecen en el listado y en el detalle.

5. Como estudiante, quiero eliminar tareas que ya no necesito.
   - Criterio: después de confirmar la eliminación, la tarea desaparece del listado.

### Modelo de datos

La entidad Task contiene:

- id: identificador único de tipo entero.
- title: título de la tarea.
- description: descripción de la actividad.
- priority: prioridad Alta, Media o Baja.
- isCompleted: estado completada o pendiente.
- userId: identificador del usuario propietario.

### Pantallas previstas

1. Lista de tareas: muestra las actividades registradas.
2. Detalle de tarea: presenta la información completa de una actividad.
3. Formulario de tarea: permitirá crear y editar actividades.

### Requisitos funcionales

- Visualizar el listado de tareas.
- Consultar el detalle de una tarea.
- Crear nuevas tareas.
- Editar tareas existentes.
- Eliminar tareas.

### Requisitos no funcionales

- La interfaz debe ser sencilla y comprensible.
- La navegación debe permitir regresar al listado.
- Si una tarea no existe, la aplicación debe mostrar un mensaje.
- El código debe mantener una estructura organizada.

### Contrato de API previsto

GET /tasks - Consultar todas las tareas.

GET /tasks/:id - Consultar una tarea específica.

POST /tasks - Registrar una nueva tarea.

PATCH /tasks/:id - Actualizar una tarea.

DELETE /tasks/:id - Eliminar una tarea.

La API se integrará en sesiones posteriores.
Actualmente TaskFlow utiliza datos locales de prueba.
