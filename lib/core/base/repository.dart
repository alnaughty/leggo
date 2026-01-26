import 'package:leggo/core/base/model.dart';

abstract class Repository<T extends Model> {
  Future<T> getById(String id);

  Future<List<T>> getAll();

  Future<T> create(T model);

  Future<T> update(T model);

  Future<void> delete(String id);

  Stream<T>? watchById(String id);

  Stream<List<T>>? watchAll();
}
