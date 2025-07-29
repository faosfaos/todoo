import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoo/features/task/domain/entities/entity.dart';
import 'package:todoo/features/task/presentation/bloc/task_bloc.dart';
import 'package:todoo/o_package/extensions/logext_ext.dart';

import '../widgets/build_list_tile.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: _buildBody(context),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      //! iki state durumuna bakar..
      //! listenin uzunluklari ayni ise guncellemez
      buildWhen: (previous, current) {
        if (previous is StateLoadedTask && current is StateLoadedTask) {
          return previous.entityList.length != current.entityList.length;
        }
        return true;
      },
      builder: (context, state) {
        if (state is StateLoadingTask) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is StateErrorTask) {
          return Center(child: Text(state.message));
        } else if (state is StateLoadedTask) {
          return _buildListView(state, context);
        }
        return const SizedBox.shrink();
      },
    );
  }

  ListView _buildListView(StateLoadedTask state, BuildContext context) {
    ("Build Listvew").log();
    return ListView.builder(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 2),
      itemCount: state.entityList.length,
      itemBuilder: (context, index) {
        final task = state.entityList[index];
        return BuildListTile(task: task, index: index);
      },
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () {
            if (state is StateLoadedTask) {
              final int length = state.entityList.length;
              Entity entity = Entity(
                id: DateTime.now().microsecondsSinceEpoch,
                task: "Task - $length",
                content: "Content - $length",
              );
              context.read<TaskBloc>().add(EventAddTask(entity: entity));
            }
          },
          child: const Icon(Icons.add),
        );
      },
    );
  }
}
