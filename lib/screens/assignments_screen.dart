import 'package:app_students/models/models.dart';
import 'package:app_students/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AssignmentsScreen extends StatelessWidget {
  final Course course;

  const AssignmentsScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(course.nombre);
    return Scaffold(
      appBar: CustomAppBar(title: 'Asignaciones'),
      body: Row(
        children: [
          titleCard('Tareas'),
          // CardHomework()
          // Container(
          //   child: ListView.builder(
          //     itemCount: 10,
          //     itemBuilder: (context, index) {
          //       return Card(
          //         child: ListTile(
          //           leading: Icon(Icons.list),
          //           title: Text('Tarea'),
          //           subtitle: Text('descripción de la tarea'),
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }

  Padding titleCard(title) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class CardHomework extends StatelessWidget {
  // const CardHomework({
  //   Key? key,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('tareas'),
    );
  }
}
