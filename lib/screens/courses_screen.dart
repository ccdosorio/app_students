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

    return Scaffold(
      appBar: CustomAppBar(title: 'Cursos'),
      body: ListView.builder(
        itemCount: courseService.courses.length,
        itemBuilder: (BuildContext context, int index) => CardCourse(
          course: courseService.courses[index],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
