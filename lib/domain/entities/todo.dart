import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  const Todo({
    required this.description,
    this.isDone = false,
  });

  final String description;
  final bool isDone;

  @override
  List<Object?> get props => [description, isDone];
}
