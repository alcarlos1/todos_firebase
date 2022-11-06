import 'package:dartz/dartz.dart';
import 'package:todo_firebase/core/error/error.dart';
import 'package:todo_firebase/domain/entities/entities.dart';

abstract class TodoRepository {
  Future<Either<Failure, Todo>> addTodo({required String description});
  Future<Either<Failure, List<Todo>>> loadTodos();
  Future<Either<Failure, Todo>> removeTodo({required Todo todo});
}
