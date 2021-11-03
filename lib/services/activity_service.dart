import 'dart:async';
import 'dart:convert';

import 'package:app_students/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ActivityService {
  final String _baseURL = 'apistudentsnodejs.herokuapp.com';
  final storage = new FlutterSecureStorage();

  StreamController<List<Module>> _streamController = new StreamController();
  StreamController<List<Module>> get streamController => _streamController;

  List<Module> modules = [];
  int idActivity;

  ActivityService(this.idActivity) {
    this.loadActivities(this.idActivity);
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

  loadActivities(int idActivity) async {
    final jsonData = await _getJsonData('/actividades/$idActivity');
    Map<String, dynamic> res = jsonDecode(jsonData);

    if (res['status'] == 0 ) {
      final activityResponse = ActivityResponse.fromJson(jsonData);
      this.modules = activityResponse.data.modules;
      _streamController.sink.add(this.modules);
    } else {
      _streamController.sink.add([]);
    }

  }

  dispose() {
    _streamController.close();
  }

}