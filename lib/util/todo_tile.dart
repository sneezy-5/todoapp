import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: editFunction,
              icon: Icons.edit,
              backgroundColor: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          // width: 400,
          height: 100,
          // padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            //mainAxisSize:MainAxisSize.min ,
            children: [
              // checkbox
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              // task name
             Container(
               width: 270,
                 child: Text(
                   taskName,
                   overflow: TextOverflow.clip,
                   maxLines: 3,
                   softWrap: true,
                   style: TextStyle(

                     color: Colors.white,
                     fontSize: 20,
                     decoration: taskCompleted
                         ? TextDecoration.lineThrough
                         : TextDecoration.none,
                   ),
                 ),
             )
            ],
          ),
        ),
      ),
    );
  }
}


/*
return Padding(
padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
child: Slidable(
endActionPane: ActionPane(
motion: const StretchMotion(),
children: [
SlidableAction(
onPressed: editFunction,
icon: Icons.edit,
backgroundColor: Colors.grey.shade300,
borderRadius: BorderRadius.circular(12),
),
SlidableAction(
onPressed: deleteFunction,
icon: Icons.delete,
backgroundColor: Colors.red.shade300,
borderRadius: BorderRadius.circular(12),
)
],
),
child: Container(
// width: 400,
height: 100,
// padding: EdgeInsets.all(24),
decoration: BoxDecoration(
color: Colors.blueAccent,
borderRadius: BorderRadius.circular(12),
),
child: Row(
//mainAxisSize:MainAxisSize.min ,
children: [
// checkbox
Checkbox(
value: taskCompleted,
onChanged: onChanged,
activeColor: Colors.black,
),

// task name
Text(
taskName,
overflow: TextOverflow.clip,
maxLines: 2,
softWrap: false,
style: TextStyle(

color: Colors.white,
fontSize: 20,
decoration: taskCompleted
? TextDecoration.lineThrough
    : TextDecoration.none,
),
),
],
),
),
),
);*/
