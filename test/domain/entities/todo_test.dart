import 'package:flutter_test/flutter_test.dart';
import 'package:todo_firebase/domain/entities/todo.dart';

void main() {
  late Todo defaultTodo;

  setUp(() {
    defaultTodo = const Todo(description: "");
  });

  test('should create a Todo', () {
    expect(const Todo(description: ""), defaultTodo);
  });

  test('should create a default todo with isDone to false', () {
    expect(defaultTodo.isDone, false);
  });

  test('should create a todo with an "description" description', () {
    const Todo myTodo = Todo(description: "description");
    expect(myTodo.description, "description");
  });
}
