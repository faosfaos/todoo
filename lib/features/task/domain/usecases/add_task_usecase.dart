import 'package:todoo/features/task/domain/entities/entity.dart';
import 'package:todoo/features/task/domain/repositories/task_repository.dart';

class AddTaskUsecase {
  final TaskRepository _taskRepository;

  AddTaskUsecase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  Future<void> call(Entity entity) async {
    await _taskRepository.addTask(entity);
  }
}
