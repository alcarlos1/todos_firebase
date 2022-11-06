import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_firebase/domain/entities/entities.dart';
import 'package:todo_firebase/domain/repositories/todo_repository.dart';
import 'package:todo_firebase/domain/usecases/usecases.dart';

import 'add_todo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoRepository>()])
void main() {
  late RemoveTodo usecase;
  late MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = RemoveTodo(repository: mockTodoRepository);
  });

  final tTodo = Todo(description: "Remove a todo", createdAt: DateTime.now());

  test('should remove todo and return it (rollback posibility) from repository',
      () async {
    //Arrange
    when(mockTodoRepository.removeTodo(todo: anyNamed("todo")))
        .thenAnswer((_) async => Right(tTodo));
    //Act
    final result = await usecase(RemoveParams(todo: tTodo));
    //Assert
    expect(result, Right(tTodo));
    verify(mockTodoRepository.removeTodo(todo: tTodo));
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
