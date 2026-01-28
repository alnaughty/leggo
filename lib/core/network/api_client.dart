import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
// ignore: library_prefixes
import 'package:http/io_client.dart' as httpIO;
import 'package:leggo/core/utils/constants.dart';
import 'package:leggo/core/utils/flavors.dart' show F;

class ApiClient {
  late final String _baseUrl;
  late final http.Client _client;

  ApiClient() {
    _baseUrl = F.baseUrl;
    if (_baseUrl.isEmpty) {
      throw Exception('BASE_DOMAIN not found in .env');
    }
    _client = _createPinnedClient();
  }
  http.Client _createPinnedClient() {
    final ioClient = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        return _validateCertificate(cert);
      };

    return httpIO.IOClient(ioClient);
  }

  bool _validateCertificate(X509Certificate cert) {
    final sha256 = base64.encode(cert.der);
    final expectedSha256 = F.sha256Base64Hash;
    return sha256 == expectedSha256;
  }

  Future<Map<String, dynamic>> get(String path, {String? authToken}) async {
    final response = await _client.get(
      Uri.parse('$_baseUrl$path'),
      headers: {
        'Content-Type': 'application/json',
        if (authToken != null) ...{AppConstants.authHeader: authToken},
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw HttpException(
        'GET $path failed with status ${response.statusCode}',
      );
    }
  }

  Future<Map<String, dynamic>> post(
    String path,
    Map<String, dynamic> body, {
    String? authToken,
  }) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl$path'),
      headers: {
        'Content-Type': 'application/json',
        if (authToken != null) ...{AppConstants.authHeader: authToken},
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw HttpException(
        'POST $path failed with status ${response.statusCode}',
      );
    }
  }

  Future<Map<String, dynamic>> put(
    String path,
    Map<String, dynamic> body, {
    String? authToken,
  }) async {
    final response = await _client.put(
      Uri.parse('$_baseUrl$path'),
      headers: {
        'Content-Type': 'application/json',
        if (authToken != null) ...{AppConstants.authHeader: authToken},
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw HttpException(
        'PUT $path failed with status ${response.statusCode}',
      );
    }
  }

  Future<void> delete(String path, {String? authToken}) async {
    final response = await _client.delete(
      Uri.parse('$_baseUrl$path'),
      headers: {
        'Content-Type': 'application/json',
        if (authToken != null) ...{AppConstants.authHeader: authToken},
      },
    );

    if (response.statusCode != 200) {
      throw HttpException(
        'DELETE $path failed with status ${response.statusCode}',
      );
    }
  }
}

class HttpException implements Exception {
  final String message;
  HttpException(this.message);
  @override
  String toString() => message;
}
