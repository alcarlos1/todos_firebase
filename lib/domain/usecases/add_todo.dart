import 'package:todo_firebase/domain/entities/todo.dart';

abstract class AddTodo {
  Future<Todo> add({required String description});
}
