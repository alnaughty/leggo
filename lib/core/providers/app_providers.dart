import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leggo/core/services/secure_storage_services.dart';

final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService();
});
