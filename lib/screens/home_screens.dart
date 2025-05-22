import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import '../widgets/empty_state.dart';
import '../widgets/add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];
  int _selectedIndex = 0;
  
  void _addTask(String title, {String? note}) {
    if (title.isNotEmpty) {
      setState(() {
        _tasks.add(Task(title: title, note: note));
      });
    }
  }

  void _toggleTask(String id) {
    setState(() {
      final taskIndex = _tasks.indexWhere((task) => task.id == id);
      if (taskIndex != -1) {
        _tasks[taskIndex].isCompleted = !_tasks[taskIndex].isCompleted;
      }
    });
  }

  void _deleteTask(String id) {
    setState(() {
      _tasks.removeWhere((task) => task.id == id);
    });
  }

  void _showAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => AddTaskBottomSheet(
        onAddTask: _addTask,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Filter tasks based on selected tab
    List<Task> filteredTasks = [];
    switch (_selectedIndex) {
      case 0: // All tasks
        filteredTasks = _tasks;
        break;
      case 1: // Active tasks
        filteredTasks = _tasks.where((task) => !task.isCompleted).toList();
        break;
      case 2: // Completed tasks
        filteredTasks = _tasks.where((task) => task.isCompleted).toList();
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TaskFlow',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              // Sort functionality would go here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.task_alt,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'My Tasks',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                Text(
                  '${_tasks.where((task) => !task.isCompleted).length} remaining',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: filteredTasks.isEmpty
                ? const EmptyState()
                : TaskList(
                    tasks: filteredTasks,
                    onToggle: _toggleTask,
                    onDelete: _deleteTask,
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskBottomSheet,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'All',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_box_outline_blank),
            label: 'Active',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_box),
            label: 'Completed',
          ),
        ],
      ),
    );
  }
}
