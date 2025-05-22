import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_card.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(String) onToggle;
  final Function(String) onDelete;

  const TaskList({
    super.key,
    required this.tasks,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskCard(
          task: tasks[index],
          onToggle: onToggle,
          onDelete: onDelete,
        );
      },
    );
  }
}
