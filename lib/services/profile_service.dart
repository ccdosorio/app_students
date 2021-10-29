import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:app_students/models/models.dart';

class ProfileService {
  final String _baseURL = 'apistudentsnodejs.herokuapp.com';
  final storage = new FlutterSecureStorage();

  StreamController<List<Profile>> _streamController = new StreamController();
  StreamController<List<Profile>> get streamController => _streamController;

  List<Profile> profile = [];

  ProfileService() {
    this.loadProfile();
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

  loadProfile() async {
    final idUser = await storage.read(key: 'iduser');

    final jsonData = await _getJsonData('/usuarios/$idUser');
    final profileResponse = ProfileResponse.fromJson(jsonData);

    this.profile = profileResponse.data;

    _streamController.sink.add(this.profile);
  }

  dispose() {
    _streamController.close();
  }
}
