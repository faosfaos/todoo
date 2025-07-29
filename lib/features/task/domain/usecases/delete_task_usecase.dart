import 'package:todoo/features/task/domain/entities/entity.dart';
import 'package:todoo/features/task/domain/repositories/task_repository.dart';

class DeleteTaskUsecase {
  final TaskRepository _taskRepository;

  DeleteTaskUsecase({required TaskRepository taskRepository})
    : _taskRepository = taskRepository;
  Future<void> call(Entity entity) async {
    await _taskRepository.deleteTask(entity);
  }
}
