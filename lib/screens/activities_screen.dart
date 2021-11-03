import 'package:flutter/material.dart';

import 'package:app_students/models/models.dart';
import 'package:app_students/services/services.dart';
import 'package:app_students/screens/screens.dart';

class ActivitiesScreen extends StatefulWidget {
  final Course course;

  ActivitiesScreen(this.course);

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  var activityService;

  @override
  void initState() {
    super.initState();
    activityService = new ActivityService(this.widget.course.codigoa);
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<List<Module>>(
        stream: activityService.streamController.stream,
        builder: (BuildContext context,AsyncSnapshot<List<Module>> snapshot) {

          if(!snapshot.hasData) {
            return LoadingScreen('Actividades');
          }

          if(snapshot.hasData && snapshot.data!.length == 0) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Actividades"),
                centerTitle: true,
              ),
              body: Center(
                child: Text('No hay actividades para la asignación'),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text("Actividades"),
              centerTitle: true,
            ),
              body: ListView.builder(
                itemCount: activityService.modules.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = activityService.modules[index];

                  Widget containerChildren = Container();
                  List<Widget> lsWidget = [Divider()];
                  if(item.tasks != null && item.tasks.isNotEmpty) {
                    for(var i = 0; i < item.tasks.length; i++) {
                      String title = item.tasks[i].title;
                      String description = item.tasks[i].description;
                      //String date = item.tasks[i].date;
                      lsWidget.add(Text(title));
                      lsWidget.add(Text(description));
                      // lsWidget.add(Text(date.toString()));
                      lsWidget.add(Divider());
                    }
                  }

                  return Card(
                    margin: EdgeInsets.all(12.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      onTap: () {
                        print('Soy osorio y me gusta la 8==3--(o")');
                      },
                      title: Text(item.module, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      subtitle:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: lsWidget,
                      ),
                      leading: Icon(Icons.book_outlined),
                    ),
                  );
                }
              )
          );
        }
    );
  }
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}




