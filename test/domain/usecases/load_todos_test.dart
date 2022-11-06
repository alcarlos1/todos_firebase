import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_firebase/core/usecase/usecase.dart';
import 'package:todo_firebase/domain/entities/entities.dart';
import 'package:todo_firebase/domain/repositories/repositories.dart';
import 'package:todo_firebase/domain/usecases/usecases.dart';

import 'add_todo_test.mocks.dart';

@GenerateNiceMocks([MockSpec<TodoRepository>()])
void main() {
  late MockTodoRepository mockTodoRepository;
  late LoadTodos usecase;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = LoadTodos(repository: mockTodoRepository);
  });

  final tTodos = [
    Todo(description: "First todo", createdAt: DateTime.now()),
    Todo(description: "Second todo", createdAt: DateTime.now()),
  ];

  test('should load all todos from the repository ', () async {
    //Arrange
    when(mockTodoRepository.loadTodos()).thenAnswer((_) async => Right(tTodos));
    //Act
    final result = await usecase(NoParam());
    //Assert
    expect(result, Right(tTodos));
    verify(mockTodoRepository.loadTodos());
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
