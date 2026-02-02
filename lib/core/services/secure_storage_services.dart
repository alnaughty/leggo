import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorageService {
  final _storage = FlutterSecureStorage(
    aOptions: AndroidOptions.biometric(
      enforceBiometrics: false,
      biometricPromptTitle: 'Authenticate',
    ),
  );

  Future<void> write(String key, String value) async =>
      await _storage.write(key: key, value: value);

  Future<String?> read(String key) async => await _storage.read(key: key);

  Future<void> delete(String key) async => await _storage.delete(key: key);

  Future<void> deleteAll() async => await _storage.deleteAll();
}
