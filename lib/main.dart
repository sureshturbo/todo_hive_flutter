import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/todo_tile.dart';

import 'data/todo_database.dart';
void main() async {

  ///init the hive
  await Hive.initFlutter();

  ///open a box
  var box =await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_page(),
    );
  }
}
class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  ///reference the hive box
  final _myBox = Hive.box('mybox');
  @override
  void initState() {
    if(_myBox.get("todolist")== null){
      db.createInitialData();
    }else{
      db.loaddata();
    }
    // TODO: implement initState
    super.initState();
  }
  ///text controller
  final _controller = TextEditingController();
  TodoDatabase db = TodoDatabase();
  ///checkbox was tapped
  void checkBoxchanged(bool? value,int index){
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updatabase();
  }
  ///save new task
  void SaveNewTask(){
      setState(() {
        db.todolist.add([_controller.text,false]);
        _controller.clear();
      });
      Navigator.of(context).pop();
      db.updatabase();
  }
  //create new task
  void createNewTask(){
     showDialog(
         context: context, builder: (context){
           return Dialog_box(
             controller: _controller,
             onSave: SaveNewTask,
             onCancel: ()=> Navigator.of(context).pop(),
           );
     });
  }
  //delete task
  void deletask(int index){
setState(() {
  db.todolist.removeAt(index);
});
db.updatabase();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(child: Text('TO DO')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
          onPressed:createNewTask,
        child: Icon(Icons.add,color: Colors.black,)),
      body:
          ///first check list we need more dynamic so we use listview builder
      // ListView(
      //   children: [
      //     ToDo_tile(
      //       taskname: 'gym',
      //       taskCompleted: true,
      //       onChanged: (p0){},
      //     ),
      //     ToDo_tile(
      //       taskname: 'yoga',
      //       taskCompleted: true,
      //       onChanged: (p0){},
      //     ),
      //     ToDo_tile(
      //       taskname: 'book reading',
      //       taskCompleted: true,
      //       onChanged: (p0){},
      //     ),
      //
      //   ],
      // ),
      ListView.builder(
        itemCount: db.todolist.length,
          itemBuilder:
          (context, index) {
              return ToDo_tile(
                taskname: db.todolist[index][0],
                taskCompleted: db.todolist[index][1],
                onChanged: (value) => checkBoxchanged(value, index),
              deleteFunction: (context)=>deletask(index),
              );
          },
      )
    );
  }
}
