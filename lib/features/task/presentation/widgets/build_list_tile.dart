import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoo/features/task/presentation/bloc/task_bloc.dart';
import 'package:todoo/o_package/extensions/logext_ext.dart';

import '../../domain/entities/entity.dart';
import 'dialogs/delete_task_dialog.dart';
import 'dialogs/update_task_dialog.dart';

class BuildListTile extends StatelessWidget {
  const BuildListTile({super.key, required this.task, required this.index});

  final Entity task;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: BlocSelector<TaskBloc, TaskState, Entity?>(
        selector: (state) {
          if (state is StateLoadedTask) {
            return state.entityList.firstWhere(
              (element) => element.id == task.id,
              orElse: () => task,
            );
          }
          return task;
        },
        builder: (context, incommingTask) {
          if (incommingTask == null) return const SizedBox.shrink();
          return _buildListTile(incommingTask, context);
        },
      ),
    );
  }

  ListTile _buildListTile(Entity incommingTask, BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text("${index + 1}")),
      title: Text(incommingTask.task),
      subtitle: Text(incommingTask.content),
      trailing: Checkbox(
        value: incommingTask.isDone,
        onChanged: (value) {
          context.read<TaskBloc>().add(EventToggleTask(entity: incommingTask));
          ("${incommingTask.task} - ${!incommingTask.isDone}").log();
        },
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => UpdateTaskDialog(task: incommingTask),
        );
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) => DeleteTaskDialog(task: incommingTask),
        );
      },
    );
  }
}
