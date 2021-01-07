import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:spark_app/core/repository/persistence/storage_interface.dart';

class SecuredStorage implements StorageInterface {

  SecuredStorage(this._secureStorage);

  FlutterSecureStorage _secureStorage;

  @override
  Future<void> clear() =>  _secureStorage.deleteAll();

  @override
  Future<void> reset() => _secureStorage.deleteAll();

  @override
  Future<void> saveString(String key, String value) => _secureStorage.write(key: key, value: value);

  @override
  Future<String> getString(String key) => _secureStorage.read(key: key);
}