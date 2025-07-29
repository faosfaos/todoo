import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entity.dart';
import '../../bloc/task_bloc.dart';

class DeleteTaskDialog extends StatelessWidget {
  const DeleteTaskDialog({super.key, required this.task});

  final Entity task;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Dikkat", textAlign: TextAlign.center),
      content: Text(
        "${task.task} silenecek,\nonaylıyor musunuz?",
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Vazgeç"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<TaskBloc>().add(EventDeleteTask(entity: task));
          },
          child: const Text("Evet"),
        ),
      ],
    );
  }
}
