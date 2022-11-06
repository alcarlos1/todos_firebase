import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String description;
  final bool isDone;
  final DateTime createdAt;

  const TodoModel({
    required this.description,
    required this.isDone,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [description, isDone, createdAt];
}
