import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:spark_app/core/repository/persistence/secured_storage.dart';

class LocalPersistence {

  static const String appToken = "keys.token-";
  static const String currentUser = "keys.currentUser";

  final SecuredStorage securedStorage;

  LocalPersistence(this.securedStorage);

  static LocalPersistence _localPersistence;

  static LocalPersistence instance() {
      if(_localPersistence == null) {
        _localPersistence = LocalPersistence(SecuredStorage(FlutterSecureStorage()));
      }

      return _localPersistence;
  }

  Future<void> setAppToken(String key, String token) => securedStorage.saveString(key, token);

  Future<String> getAppToken(String userId) => securedStorage.getString(userId);

  Future<void> setCurrentUser(String key, String token) => securedStorage.saveString(key, token);

  Future<String> getCurrentUser() => securedStorage.getString(currentUser);

}