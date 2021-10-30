import 'dart:async';
import 'dart:convert';

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

  static Future<List<dynamic>> getCarrera() async {
    final String _baseURL = 'apistudentsnodejs.herokuapp.com';
    final url = Uri.https(_baseURL, '/carreras');
    final res =
        await http.get(url, headers: {"Content-Type": "application/json"});

    final Map<String, dynamic> decodedRes = await json.decode(res.body);

    final List<dynamic> fault = [decodedRes['status']];

    if (decodedRes['status'].toString() != "0") {
      return fault;
    } else {
      return decodedRes['data'];
    }
  }

  static Future<List<dynamic>> getTipo() async {
    final String _baseURL = 'apistudentsnodejs.herokuapp.com';
    final url = Uri.https(_baseURL, '/type');
    final res =
        await http.get(url, headers: {"Content-Type": "application/json"});

    final Map<String, dynamic> decodedRes = await json.decode(res.body);

    final List<dynamic> fault = [decodedRes['status']];

    if (decodedRes['status'].toString() != "0") {
      return fault;
    } else {
      return decodedRes['data'];
    }
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
