import 'package:todo_firebase/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_firebase/core/usecase/usecase.dart';
import 'package:todo_firebase/domain/entities/entities.dart';
import 'package:todo_firebase/domain/repositories/todo_repository.dart';

class RemoveTodo extends UseCase<Todo, RemoveParams> {
  final TodoRepository repository;

  RemoveTodo({required this.repository});

  @override
  Future<Either<Failure, Todo>> call(RemoveParams params) {
    return repository.removeTodo(todo: params.todo);
  }
}

class RemoveParams {
  final Todo todo;

  const RemoveParams({required this.todo});
}
