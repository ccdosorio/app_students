import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:app_students/models/models.dart';

class CourseService extends ChangeNotifier {
  final String _baseURL = 'apistudentsnodejs.herokuapp.com';
  final storage = new FlutterSecureStorage();

  List<Course> courses = [];
  bool isLoading = true;

  CourseService() {
    this.loadCourses();
  }

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.http(_baseURL, endpoint);

    final res = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": await storage.read(key: 'token') ?? ''
      },
    );
    return res.body;
  }

  loadCourses() async {
    this.isLoading = true;
    notifyListeners();

    final String? authUser = await storage.read(key: 'user');
    final Map<String, dynamic> decodedRes = json.decode(authUser!);

    final iduser = decodedRes['codigou'];

    final jsonData = await _getJsonData('/asignaciones/$iduser');
    final courseResponse = CourseResponse.fromJson(jsonData);

    this.courses = courseResponse.data;
    this.isLoading = false;
    notifyListeners();
  }
}
