import 'package:dartz/dartz.dart';
import 'package:todo_firebase/core/error/error.dart';
import 'package:todo_firebase/core/usecase/usecase.dart';
import 'package:todo_firebase/domain/entities/entities.dart';
import 'package:todo_firebase/domain/repositories/repositories.dart';

class AddTodo extends UseCase<Todo, AddParams> {
  final TodoRepository repository;

  AddTodo({required this.repository});

  @override
  Future<Either<Failure, Todo>> call(AddParams params) async {
    return await repository.addTodo(description: params.description);
  }
}

class AddParams {
  final String description;

  const AddParams({required this.description});
}
