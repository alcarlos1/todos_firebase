import 'package:todo_firebase/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_firebase/core/usecase/usecase.dart';
import 'package:todo_firebase/domain/entities/entities.dart';
import 'package:todo_firebase/domain/repositories/repositories.dart';

class LoadTodos extends UseCase<List<Todo>, NoParam> {
  final TodoRepository repository;

  LoadTodos({required this.repository});

  @override
  Future<Either<Failure, List<Todo>>> call(NoParam params) {
    return repository.loadTodos();
  }
}
