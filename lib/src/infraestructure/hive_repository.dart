import 'package:hive/hive.dart';

class HiveRepository<T> {
  final HiveInterface interface;

  HiveRepository(this.interface);

  T? get(String boxName, String key) {
    final box = interface.box<T>(boxName);
    final result = box.get(key);
    print('se obtuvo de $key la data $result');
    return result;
  }

  List<T> getList(String boxName) {
    final box = interface.box<T>(boxName);
    return box.values.toList();
  }

  void clear(String boxName) {
    final box = interface.box<T>(boxName);
    box.clear();
  }

  Future<void> put(String boxName, String key, T data) async {
    if (data == null) return;
    print('se inserto en $key la data $data ');
    final box = interface.box<T>(boxName);
    return await box.put(key, data);
  }

  void delete(String boxName, String key) {
    final box = interface.box<T>(boxName);
    box.delete(key);
  }
}
