part of 'task_bloc.dart';

sealed class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

final class StateIntitalTask extends TaskState {}

final class StateLoadingTask extends TaskState {}

final class StateErrorTask extends TaskState {
  final String message;

  const StateErrorTask({required this.message});
  @override
  List<Object> get props => [message];
}

final class StateLoadedTask extends TaskState {
  final List<Entity> entityList;

  const StateLoadedTask({required this.entityList});
  @override
  List<Object> get props => [entityList];
}
