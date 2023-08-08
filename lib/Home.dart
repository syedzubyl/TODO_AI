import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/colors.dart';

import 'Model/Todo_item.dart';
import 'Profile.dart';
import 'Widget/Todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionReference todoCollection =
  FirebaseFirestore.instance.collection('todos');
  late final Todo todo;
  final Todolist =Todo.todoitem();
  final _texteditingControl = TextEditingController();
  List<Todo> _foundTODO =[];

@override
  void initState() {
   _foundTODO = Todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tdBGColor,
        title: const Text("TODO LISTS",
        style: TextStyle(color: Colors.black87),),
        actions: [
          IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) =>const Profile()));}, icon:  const CircleAvatar(
       backgroundImage: AssetImage('asstes/profilelogo.jpg'),
    ))
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,
            vertical: 5),
            margin: EdgeInsets.only(bottom: 0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:TextField(
                    onChanged: (value) => _runresult(value),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        color: tdBlack,
                        size: 20,
                      ),
                      prefixIconConstraints:BoxConstraints(
                        maxHeight: 20,
                        maxWidth: 25
                      ),
                      border: InputBorder.none,

                      hintText: "search",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize: 20
                      )
                    ),

                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40, bottom: 20),
                        child: const Text("Today List",
                        style: TextStyle(fontSize: 30),),
                      ),
                      for(Todo todo in _foundTODO)
                         Todo_list(todo: todo,
                         OnToDoChanged: _handledToDoChange,
                         onDeleteItem: _handledToDelete,),



                    ],
                  ),
                )
              ],
            )
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  margin: EdgeInsets.only(
                      bottom: 10,
                  right: 20,
                  left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    boxShadow:[BoxShadow(
                    color: Colors.grey,
                   offset: Offset(0.0,0.0),
                   blurRadius: 10.0,
                     spreadRadius: 0.0,
                    ),],
                    borderRadius: BorderRadius.circular(10),
                    ),
                  child: TextField(
                    controller: _texteditingControl,
                    decoration: InputDecoration(
                      hintText: "Add new ToDo List",
                      border: InputBorder.none,

                    ),
                  ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child:  FloatingActionButton(
                    onPressed: () {  
                      _totextcontroller(_texteditingControl.text);
                    },
                    backgroundColor: Colors.blue.shade600,
                    child: const Icon(Icons.add),),
                )
              ],
            ),
          )
        ],
      ),

    );
  }
  void _handledToDoChange(Todo todo) async {
    todo.isDone = !todo.isDone;
    await todoCollection.doc(todo.id).update({'isDone': todo.isDone});
    setState(() {});
  }
void _handledToDelete(String id){
    setState(() {
      Todolist.removeWhere((item) => item.id == id);
    });

}
/*void _totextcontroller(String toDo){
    setState(() {
      Todolist.add(Todo(id: DateTime.now().microsecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    _texteditingControl.clear();
}

 */

  void _totextcontroller(String toDo) async {
    String id = DateTime.now().microsecondsSinceEpoch.toString();
    await todoCollection.doc(id).set({
      'id': id,
      'todoText': toDo,
      'isDone': false,
    });
    _texteditingControl.clear();
  }
void _runresult(String enteredKeyword){
  List<Todo> result =[];
  if(enteredKeyword.isEmpty ){
    result =Todolist;
  }else{
    result = Todolist.where((item) => !item
        .todoText
        .toLowerCase()
        .contains(enteredKeyword
        .toLowerCase()))
        .toList();
  }
  setState(() {
    _foundTODO =result;
  });

}
}
