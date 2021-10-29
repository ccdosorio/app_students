import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:app_students/models/career_response.dart';
import 'package:app_students/models/models.dart';

class CareerService {
  final String _baseURL = 'apistudentsnodejs.herokuapp.com';
  final storage = new FlutterSecureStorage();

  StreamController<List<Career>> _streamController = new StreamController();
  StreamController<List<Career>> get streamController => _streamController;

  List<Career> careers = [];

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
    final jsonData = await _getJsonData('/carreras');
    final careerResponse = CareerResponse.fromJson(jsonData);
    this.careers = careerResponse.data;

    _streamController.sink.add(careers);
  }

  dispose() {
    _streamController.close();
  }
}
