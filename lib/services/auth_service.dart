import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyAuQJwY2eYs1_40xb4gMsI5r26gCVghWgA';

  final String _baseUrlApi = 'apistudentsnodejs.herokuapp.com';

  final storage = new FlutterSecureStorage();

  /// Si retornamos hay un error, si no, todo bien: Firebase
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final res = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodedRes = json.decode(res.body);

    if (decodedRes.containsKey('idToken')) {
      // Guardar token
      // await storage.write(key: 'token', value: decodedRes['idToken']);
      return null;
    } else {
      return decodedRes['error']['message'];
    }
  }

  // Llamada a endpoint Firebase para hacer login
  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final res = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodedRes = json.decode(res.body);

    if (decodedRes.containsKey('idToken')) {
      // Guardar token
      // await storage.write(key: 'token', value: decodedRes['idToken']);
      return null;
    } else {
      return decodedRes['error']['message'];
    }
  }

  // Llamada a endpoint nodejs
  Future<String?> signIn(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };
    final url = Uri.https(_baseUrlApi, '/login');

    final res = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData));

    final Map<String, dynamic> decodedRes = json.decode(res.body);

    if (decodedRes['status'] == 0) {
      // Guardar token
      await storage.write(key: 'token', value: decodedRes['data']['token']);
      await storage.write(key: 'user', value: json.encode(decodedRes['data']));
      return null;
    } else {
      return decodedRes['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'usert');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
