import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:leggo/core/network/api_client.dart';
import 'package:leggo/core/utils/flavors.dart' show F;

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(baseUrl: F.baseUrl);
});
