import 'package:flutter_test/flutter_test.dart';
import 'package:todo_firebase/domain/entities/todo.dart';

void main() {
  late Todo defaultTodo;

  setUp(() {
    defaultTodo = Todo(description: "", createdAt: DateTime.now());
  });

  test('should create a Todo', () {
    expect(defaultTodo is Todo, true);
  });

  test('should create a default todo with isDone to false', () {
    expect(defaultTodo.isDone, false);
  });

  test('should create a todo with an "description" description', () {
    Todo myTodo = Todo(description: "description", createdAt: DateTime.now());
    expect(myTodo.description, "description");
  });
}
