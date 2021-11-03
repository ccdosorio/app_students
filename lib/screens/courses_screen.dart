import 'package:app_students/models/course.dart';
import 'package:app_students/screens/screens.dart';
import 'package:app_students/services/course_service.dart';
import 'package:flutter/material.dart';

import 'package:app_students/widgets/widgets.dart';

class CoursesScreen extends StatefulWidget {

  @override
  _CoursesScreen createState() => _CoursesScreen();
}

class _CoursesScreen extends State<CoursesScreen> {

  var courseService;

  @override
  void initState() {
    super.initState();
    courseService = new CourseService();
  }

  @override
  Widget build(BuildContext context) {


    return StreamBuilder<List<Course>>(
        stream: courseService.streamController.stream,
        builder: (BuildContext context,AsyncSnapshot<List<Course>> snapshot) {

          if(!snapshot.hasData) {
            return LoadingScreen('Cursos Actuales');
          }

          if(snapshot.hasData && snapshot.data!.length == 0) {
            return Scaffold(
              appBar: CustomAppBar(title: 'Cursos Actuales'),
              body: Center(
                child: Text('El alumno no tiene asignaciones'),
              ),
            );
          }

          return Scaffold(
            appBar: CustomAppBar(title: 'Cursos Actuales'),
            body: ListView.builder(
              itemCount: courseService.courses.length,
              itemBuilder: (BuildContext context, int index) => CardCourse(
                course: courseService.courses[index],
              ),
            ),
          );
        }
    );
  }
}