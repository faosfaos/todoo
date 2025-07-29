import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoo/features/task/domain/entities/entity.dart';
import 'package:todoo/features/task/domain/usecases/add_task_usecase.dart';
import 'package:todoo/features/task/domain/usecases/delete_task_usecase.dart';
import 'package:todoo/features/task/domain/usecases/fetch_tasks_usecase.dart';
import 'package:todoo/features/task/domain/usecases/toggle_task_usecase.dart';
import 'package:todoo/features/task/domain/usecases/update_task_usecase.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final FetchTasksUsecase _fetchTasksUsecase;
  final ToggleTaskUsecase _toggleTaskUsecase;
  final AddTaskUsecase _addTaskUsecase;
  final DeleteTaskUsecase _deleteTaskUsecase;
  final UpdateTaskUsecase _updateTaskUsecase;
  TaskBloc({
    required FetchTasksUsecase fetchTasksUsecase,
    required ToggleTaskUsecase toggleTaskUsecase,
    required AddTaskUsecase addTaskUsecase,
    required DeleteTaskUsecase deleteTaskUsecase,
    required UpdateTaskUsecase updateTaskUsecase,
  }) : _fetchTasksUsecase = fetchTasksUsecase,
       _toggleTaskUsecase = toggleTaskUsecase,
       _addTaskUsecase = addTaskUsecase,
       _deleteTaskUsecase = deleteTaskUsecase,
       _updateTaskUsecase = updateTaskUsecase,
       super(StateIntitalTask()) {
    on<EventFetchTask>(_fetchTask);
    on<EventToggleTask>(_toggleTask);
    on<EventAddTask>(_addTask);
    on<EventDeleteTask>(_deleteTask);
    on<EventUpdateTask>(_updateTask);
  }

  FutureOr<void> _fetchTask(
    EventFetchTask event,
    Emitter<TaskState> emit,
  ) async {
    emit(StateLoadingTask());
    try {
      await _emitSatetLoaded(emit);
    } catch (e) {
      emit(StateErrorTask(message: "Error Fetch $e"));
    }
  }

  FutureOr<void> _toggleTask(
    EventToggleTask event,
    Emitter<TaskState> emit,
  ) async {
    try {
      await _toggleTaskUsecase(event.entity);
      await _emitSatetLoaded(emit);
    } catch (e) {
      emit(StateErrorTask(message: "Error Toggle $e"));
    }
  }

  FutureOr<void> _addTask(EventAddTask event, Emitter<TaskState> emit) async {
    try {
      await _addTaskUsecase(event.entity);
      await _emitSatetLoaded(emit);
    } catch (e) {
      emit(StateErrorTask(message: "Error Add $e"));
    }
  }

  FutureOr<void> _deleteTask(
    EventDeleteTask event,
    Emitter<TaskState> emit,
  ) async {
    try {
      await _deleteTaskUsecase(event.entity);
      await _emitSatetLoaded(emit);
    } catch (e) {
      emit(StateErrorTask(message: "Error Delete $e"));
    }
  }

  FutureOr<void> _updateTask(
    EventUpdateTask event,
    Emitter<TaskState> emit,
  ) async {
    try {
      await _updateTaskUsecase(event.entity);
      await _emitSatetLoaded(emit);
    } catch (e) {
      emit(StateErrorTask(message: "Error Update $e"));
    }
  }

  Future<void> _emitSatetLoaded(Emitter<TaskState> emit) async {
    try {
      List<Entity> entityList = await _fetchTasksUsecase();
      emit(StateLoadedTask(entityList: entityList));
    } catch (e) {
      emit(StateErrorTask(message: "Error Loaded $e"));
    }
  }
}
