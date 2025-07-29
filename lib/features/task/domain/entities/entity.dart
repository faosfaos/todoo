// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Entity extends Equatable {
  final int id;
  final String task;
  final String content;
  final bool isDone;

  const Entity({
    required this.id,
    required this.task,
    required this.content,
    this.isDone = false,
  });

  Entity copyWith({int? id, String? task, String? content, bool? isDone}) {
    return Entity(
      id: id ?? this.id,
      task: task ?? this.task,
      content: content ?? this.content,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  List<Object?> get props => [id, task, content, isDone];
}
