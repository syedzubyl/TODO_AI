import 'package:flutter/material.dart';
import 'package:todo/colors.dart';

import '../Model/Todo_item.dart';

class Todo_list extends StatelessWidget {
  final Todo todo;
  final OnToDoChanged;
  final onDeleteItem;

    const Todo_list({Key? key,required this.todo, required this.OnToDoChanged, required this.onDeleteItem }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          OnToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 20)  ,
        tileColor: Colors.white,
        leading: Icon(
         todo.isDone? Icons.check_box : Icons.check_box_outline_blank,color:tdBlue ,
        ),
        title: Text(
        todo.todoText,
        style: TextStyle(fontSize: 20,
       // fontWeight: FontWeight.bold,
        decoration:todo.isDone? TextDecoration.lineThrough : null),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          width: 35,
          height: 35,
          decoration: BoxDecoration(color: Colors.red,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: (){
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
