import 'package:app_students/screens/screens.dart';
import 'package:app_students/services/course_service.dart';
import 'package:flutter/material.dart';

import 'package:app_students/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final courseService = Provider.of<CourseService>(context);

    if (courseService.isLoading) return LoadingScreen();

    if (courseService.courses.length == 0) {
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
}
