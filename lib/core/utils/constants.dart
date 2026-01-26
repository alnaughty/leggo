class AppConstants {
  // General
  static const int maxRetryAttempts = 3;
  static const double defaultMapZoom = 15.0;

  // API
  static const String authHeader = 'Authorization';
  static const String contentType = 'application/json';

  // App-specific
  static const double defaultPickupRadius = 5.0; // km
  static const int maxPassengers = 4;
}
