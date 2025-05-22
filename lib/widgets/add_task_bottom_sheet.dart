import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  final Function(String, {String? note}) onAddTask;

  const AddTaskBottomSheet({
    super.key,
    required this.onAddTask,
  });

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  bool _showNoteField = false;

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _submitTask() {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    
    if (title.isNotEmpty) {
      widget.onAddTask(title, note: note.isNotEmpty ? note : null);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Add Task',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Task title',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (_) => _submitTask(),
          ),
          if (_showNoteField) ...[
            const SizedBox(height: 16),
            TextField(
              controller: _noteController,
              decoration: const InputDecoration(
                hintText: 'Add note',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
          const SizedBox(height: 16),
          Row(
            children: [
              TextButton.icon(
                icon: Icon(
                  _showNoteField ? Icons.remove : Icons.add,
                  size: 18,
                ),
                label: Text(_showNoteField ? 'Remove note' : 'Add note'),
                onPressed: () {
                  setState(() {
                    _showNoteField = !_showNoteField;
                    if (!_showNoteField) {
                      _noteController.clear();
                    }
                  });
                },
              ),
              const Spacer(),
              FilledButton(
                onPressed: _submitTask,
                child: const Text('Save'),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
