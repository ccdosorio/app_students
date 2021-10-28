import 'package:app_students/models/career.dart';
import 'package:flutter/material.dart';

import 'package:app_students/services/services.dart';
import 'package:app_students/widgets/widgets.dart';

class CardCareer extends StatefulWidget {

  @override
  State<CardCareer> createState() => _CardCareerState();
}

class _CardCareerState extends State<CardCareer> {

  var careerService;

  @override
  void initState() {
    super.initState();
    careerService = new CareerService();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return StreamBuilder<List<Career>>(
      stream: careerService.streamController.stream,
        builder: (BuildContext context,AsyncSnapshot<List<Career>> snapshot) {
          if (!snapshot.hasData) return CustomLinearLoading();

          return Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: careerService.careers.length,
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
                            careerService.careers[index].carrera,
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
    );
  }
}
