import 'package:flutter/material.dart';

import 'package:app_students/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: color,
      appBar: CustomAppBar(
        title: '',
      ),
      // drawer: MenuDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            _Header(color: color),
            Container(
              decoration: boxWhite(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TopBar(),
                  SizedBox(height: 20),
                  titleCard('Facultades'),
                  CardCareer(),
                  titleCard('Noticias'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding titleCard(title) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  BoxDecoration boxWhite() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35.0),
        topRight: Radius.circular(35.0),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: color),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Inicio",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Bienvenidos",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
