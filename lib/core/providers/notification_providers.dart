import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:leggo/core/services/notification_services.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  final service = NotificationService();
  service.init();
  return service;
});
