abstract class BaseLocalStorage {
  Future<void> saveString(String key, String value);
  Future<String?> getString(String key);

  Future<void> saveBool(String key, bool value);
  Future<bool?> getBool(String key);

  Future<void> remove(String key);
  Future<void> clear();
}
