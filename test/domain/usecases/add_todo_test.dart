import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_firebase/domain/entities/entities.dart';
import 'package:todo_firebase/domain/repositories/repositories.dart';
import 'package:todo_firebase/domain/usecases/add_todo.dart';

import 'add_todo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoRepository>()])
void main() {
  late AddTodo usecase;
  late MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = AddTodo(repository: mockTodoRepository);
  });

  final tDescription = "Do a test";
  final tTodo = Todo(
    description: "Do a test",
    createdAt: DateTime.now(),
  );

  test("should add a toto to the repository", () async {
    //Arrange
    when(mockTodoRepository.addTodo(description: anyNamed("description")))
        .thenAnswer((_) async => Right(tTodo));
    //Act
    final result = await usecase(AddParams(description: tDescription));
    //Assert
    expect(result, Right(tTodo));
    verify(mockTodoRepository.addTodo(description: tDescription));
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
