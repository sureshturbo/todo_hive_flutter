import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDo_tile extends StatelessWidget {
  final String taskname;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
   ToDo_tile(
       {Key? key, required this.taskname,
         required this.taskCompleted, required this.onChanged,this.deleteFunction
       }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,top: 25,right: 25),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children:[
              SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
            ]
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),

          ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.black ,),
              //task name
              Text(taskname,
                style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough:TextDecoration.none,fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
