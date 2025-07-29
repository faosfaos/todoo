import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoo/features/task/presentation/bloc/task_bloc.dart';
import 'package:todoo/o_package/extensions/logext_ext.dart';

import '../../../domain/entities/entity.dart';

class UpdateTaskDialog extends StatefulWidget {
  const UpdateTaskDialog({super.key, required this.task});
  final Entity task;

  @override
  State<UpdateTaskDialog> createState() => _UpdateTaskDialogState();
}

class _UpdateTaskDialogState extends State<UpdateTaskDialog> {
  late final TextEditingController _taskController;
  late final TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController(text: widget.task.task);
    _contentController = TextEditingController(text: widget.task.content);
  }

  @override
  void dispose() {
    _taskController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("UPDATE", textAlign: TextAlign.center),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _taskController,
            decoration: InputDecoration(
              labelText: "Task",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _contentController,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: "Content",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Vazgeç"),
        ),
        TextButton(onPressed: _handleUpdate, child: const Text("Evet")),
      ],
    );
  }

  void _handleUpdate() {
    if (_contentController.text.isNotEmpty && _taskController.text.isNotEmpty) {
      if (_taskController.text != widget.task.task ||
          _contentController.text != widget.task.content) {
        "Güncellendi".log();
        Navigator.pop(context);
        context.read<TaskBloc>().add(
          EventUpdateTask(
            entity: widget.task.copyWith(
              task: _taskController.text,
              content: _contentController.text,
            ),
          ),
        );
      } else {
        Navigator.pop(context);
        "GüncellenMEdi".log();
      }
    }
  }
}
