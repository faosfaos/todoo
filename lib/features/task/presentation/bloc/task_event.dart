part of 'task_bloc.dart';

sealed class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class EventFetchTask extends TaskEvent {}

class EventLoadingTask extends TaskEvent {}

class EventAddTask extends TaskEvent {
  final Entity entity;

  const EventAddTask({required this.entity});
  @override
  List<Object> get props => [entity];
}

class EventDeleteTask extends TaskEvent {
  final Entity entity;

  const EventDeleteTask({required this.entity});
  @override
  List<Object> get props => [entity];
}

class EventUpdateTask extends TaskEvent {
  final Entity entity;

  const EventUpdateTask({required this.entity});
  @override
  List<Object> get props => [entity];
}

class EventToggleTask extends TaskEvent {
  final Entity entity;

  const EventToggleTask({required this.entity});
  @override
  List<Object> get props => [entity];
}
