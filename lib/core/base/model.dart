abstract class Model {
  String get id;

  Map<String, dynamic> toJson();

  @override
  String toString() => '$runtimeType ${toJson()}';
}
