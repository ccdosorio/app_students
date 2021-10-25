import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_students/services/services.dart';
import 'package:app_students/widgets/widgets.dart';

class CardCareer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final careerService = Provider.of<CareerService>(context);
    final size = MediaQuery.of(context).size;
    final career = careerService.careers;

    if (careerService.isLoading) return CustomLinearLoading();

    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: career.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(left: 15.0, right: 15.0),
            height: 180,
            width: 250,
            decoration: BoxDecoration(
              color: Color.fromRGBO(214, 234, 248, 1),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/student.png',
                      height: 90.0,
                      width: 70.0,
                    ),
                  ),
                  SizedBox(width: 15),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: size.width - 280),
                    child: Text(
                      career[index].carrera,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
