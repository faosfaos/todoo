import 'package:todoo/features/task/data/datasource/data_source_repository_impl.dart';
import 'package:todoo/features/task/data/datasource/task_repository_impl.dart';
import 'package:todoo/features/task/domain/usecases/add_task_usecase.dart';
import 'package:todoo/features/task/domain/usecases/delete_task_usecase.dart';
import 'package:todoo/features/task/domain/usecases/fetch_tasks_usecase.dart';
import 'package:todoo/features/task/domain/usecases/toggle_task_usecase.dart';
import 'package:todoo/features/task/domain/usecases/update_task_usecase.dart';

abstract class UsecaseProviders {
  static late final AddTaskUsecase addTaskUsecase;
  static late final DeleteTaskUsecase deleteTaskUsecase;
  static late final FetchTasksUsecase fetchTasksUsecase;
  static late final ToggleTaskUsecase toggleTaskUsecase;
  static late final UpdateTaskUsecase updateTaskUsecase;

  static Future<void> init() async {
    DataSourceRepositoryImpl dataSourceRepository = DataSourceRepositoryImpl();
    TaskRepositoryImpl taskRepository = TaskRepositoryImpl(
      datasourceRepository: dataSourceRepository,
    );
    addTaskUsecase = AddTaskUsecase(taskRepository: taskRepository);
    deleteTaskUsecase = DeleteTaskUsecase(taskRepository: taskRepository);
    fetchTasksUsecase = FetchTasksUsecase(taskRepository: taskRepository);
    toggleTaskUsecase = ToggleTaskUsecase(taskRepository: taskRepository);
    updateTaskUsecase = UpdateTaskUsecase(taskRepository: taskRepository);
  }
}
