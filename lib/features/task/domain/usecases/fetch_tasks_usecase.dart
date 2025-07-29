import 'package:todoo/features/task/domain/entities/entity.dart';
import 'package:todoo/features/task/domain/repositories/task_repository.dart';

class FetchTasksUsecase {
  final TaskRepository _taskRepository;

  FetchTasksUsecase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  Future<List<Entity>> call() async {
    return _taskRepository.fetchTasks();
  }
}
