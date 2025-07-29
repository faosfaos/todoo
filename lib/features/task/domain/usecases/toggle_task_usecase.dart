import 'package:todoo/features/task/domain/entities/entity.dart';
import 'package:todoo/features/task/domain/repositories/task_repository.dart';

class ToggleTaskUsecase {
  final TaskRepository _taskRepository;

  ToggleTaskUsecase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  Future<void> call(Entity entity) async {
    await _taskRepository.toggleTask(entity);
  }
}
