import 'package:flutter/cupertino.dart';

class Todo{
  String id;
  String todoText;
  late bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone =false,
});
  static List<Todo> todoitem(){
  return[
    Todo(id: '01', todoText: 'Morning Excercise', isDone: true ),
    Todo(id: '02', todoText: 'Buy Groceries', isDone: true ),
    Todo(id: '03', todoText: 'Check Emails', ),
    Todo(id: '04', todoText: 'Team Meeting', ),
    Todo(id: '05', todoText: 'Work on mobile apps for 2 hour', ),
    Todo(id: '06', todoText: 'Dinner with Jenny', ),
    ];
  }
}