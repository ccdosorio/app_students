import 'package:app_students/models/course.dart';
import 'package:app_students/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ActivityHomeworkScreen extends StatelessWidget {
  final Course course;

  ActivityHomeworkScreen(this.course);

  @override
  Widget build(BuildContext context) {
    print("ActivityHomework");
    print(this.course.codigoa);
    print(this.course.curso);

    return Scaffold(
      appBar: AppBar(
        title: Text("Actividades"),
        centerTitle: true,
      ),
      // drawer: MenuDrawer(),
      body: Center(
        child: Text("Listado de actividades"),
      ),
    );
  }
}
