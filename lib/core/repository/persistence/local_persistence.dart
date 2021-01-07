import 'package:spark_app/core/repository/persistence/secured_storage.dart';

class LocalPersistence {

  static const String appToken = "keys.token-";
  static const String currentUser = "keys.currentUser";

  SecuredStorage _securedStorage;
  LocalPersistence _localPersistence;

  static LocalPersistence instance() => LocalPersistence();

  Future<void> setAppToken(String key, String token) => _securedStorage.saveString(key, token);

  Future<String> getAppToken(String userId) => _securedStorage.getString(userId);

  Future<void> setCurrentUser(String key, String token) => _securedStorage.saveString(key, token);

  Future<String> getCurrentUser() => _securedStorage.getString(currentUser);

}