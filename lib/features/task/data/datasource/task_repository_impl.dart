import 'package:todoo/features/task/data/mappers/task_mapper.dart';
import 'package:todoo/features/task/data/repositories/datasource_repository.dart';
import 'package:todoo/features/task/domain/entities/entity.dart';
import 'package:todoo/features/task/domain/repositories/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final DatasourceRepository _datasourceRepository;

  TaskRepositoryImpl({required DatasourceRepository datasourceRepository})
    : _datasourceRepository = datasourceRepository;
  @override
  Future<void> addTask(Entity entity) async {
    await _datasourceRepository.addTask(TaskMapper.toTask(entity));
  }

  @override
  Future<void> deleteTask(Entity entity) async {
    await _datasourceRepository.deleteTask(TaskMapper.toTask(entity));
  }

  @override
  Future<List<Entity>> fetchTasks() async {
    final taskList = await _datasourceRepository.fetchTasks();
    return TaskMapper.toEntityList(taskList);
  }

  @override
  Future<void> toggleTask(Entity entity) async {
    await _datasourceRepository.toggleTask(TaskMapper.toTask(entity));
  }

  @override
  Future<void> updateTask(Entity entity) async {
    await _datasourceRepository.updateTask(TaskMapper.toTask(entity));
  }
}
