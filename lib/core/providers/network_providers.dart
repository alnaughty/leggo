import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:leggo/core/network/api_client.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
