import 'package:app_students/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:app_students/models/models.dart';

class CardCourse extends StatelessWidget {
  final Course course;

  const CardCourse({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AssignmentsScreen(course: course))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          margin: EdgeInsets.only(top: 15, bottom: 20),
          width: double.infinity,
          height: 150,
          decoration: _cardBorders(context),
          child: Row(
            children: [
              SizedBox(width: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/school.png',
                  height: 90.0,
                  width: 90.0,
                ),
              ),
              SizedBox(width: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width - 190),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    Text(
                      course.nombre,
                      style: textTheme.headline5,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      course.carrera,
                      style: textTheme.subtitle1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardBorders(context) => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.3),
            offset: Offset(0, 7),
            blurRadius: 20,
          ),
        ],
      );
}
