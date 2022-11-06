import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.description,
    required this.createdAt,
    this.isDone = false,
  });

  final String description;
  final bool isDone;
  final DateTime createdAt;

  @override
  List<Object?> get props => [description, createdAt, isDone];
}
