import 'package:get_storage/get_storage.dart';
import 'package:shipping_clothing_store/core/utils/logging/logger.dart';
class CLocalStorage {
  static final CLocalStorage _instance = CLocalStorage._internal();
  factory CLocalStorage() => _instance;

  final GetStorage _storage = GetStorage();
  CLocalStorage._internal() {
    _initStorage();
  }

  Future<void> _initStorage() async {
    await GetStorage.init();
  }

  // Lưu
  Future<void> saveData<T>(String key, T value) async {
    try {
      await _storage.write(key, value);
      CLoggerHelpler.info('Data saved: $key => $value');
    } catch (e) {
      CLoggerHelpler.error('Error saving data',e);
    }
  }

  // Đọc
  T? readData<T>(String key) {
    try {
      T? value = _storage.read<T>(key);
      CLoggerHelpler.info('Data read: $key => $value');
      return value;
    } catch (e) {
      CLoggerHelpler.error('Error reading data',e);
      return null;
    }
  }

  // Xoá
  Future<void> deleteData(String key) async {
    try {
      await _storage.remove(key);
      CLoggerHelpler.warning('Data deleted: $key');
    } catch (e) {
      CLoggerHelpler.error('Error deleting data',e);
    }
  }

  //clear all 
  Future<void> clearAll() async {
    try {
      await _storage.erase();
      CLoggerHelpler.warning('All data cleared');
    } catch (e) {
      CLoggerHelpler.error('Error clearing storage',e);
    }
  }
}
