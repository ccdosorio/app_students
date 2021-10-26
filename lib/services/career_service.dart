import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:app_students/services/services.dart';

import 'package:app_students/models/career_response.dart';
import 'package:app_students/models/models.dart';

class CareerService extends ChangeNotifier {
  final String _baseURL = 'apistudentsnodejs.herokuapp.com';
  final storage = new FlutterSecureStorage();
  final authService = new AuthService();
  List<Career> careers = [];
  bool isLoading = true;

  CareerService() {
    this.loadCareers();
  }

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.https(_baseURL, endpoint);
    final res = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": await storage.read(key: 'token') ?? ''
      },
    );
    return res.body;
  }

  loadCareers() async {
    this.isLoading = true;
    notifyListeners();

    final jsonData = await _getJsonData('/carreras');
    final careerResponse = CareerResponse.fromJson(jsonData);
    this.careers = careerResponse.data;

    this.isLoading = false;
    notifyListeners();
  }
}
