abstract class StorageInterface {

  Future<void> reset();
  Future<void> clear();
  Future<void> saveString(String key, String value);
  Future<String> getString(String key);
}