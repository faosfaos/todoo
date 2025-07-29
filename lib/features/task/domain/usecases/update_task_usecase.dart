import 'package:todoo/features/task/domain/entities/entity.dart';
import 'package:todoo/features/task/domain/repositories/task_repository.dart';

class UpdateTaskUsecase {
  final TaskRepository _taskRepository;

  UpdateTaskUsecase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  Future<void> call(Entity entity) async {
    await _taskRepository.updateTask(entity);
  }
}
