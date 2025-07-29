import 'package:todoo/features/task/domain/entities/entity.dart';

abstract class TaskRepository {
  Future<List<Entity>> fetchTasks();
  Future<void> addTask(Entity entity);
  Future<void> deleteTask(Entity entity);
  Future<void> updateTask(Entity entity);
  Future<void> toggleTask(Entity entity);
}
