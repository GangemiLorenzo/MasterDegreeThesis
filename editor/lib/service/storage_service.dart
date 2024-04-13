import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for storing data in the device's memory.
@singleton
class StorageService {
  StorageService({
    required this.prefs,
  });

  final SharedPreferences prefs;

  /// Returns the value associated with the [key] or null if it doesn't exist.
  String? getString(String key) => prefs.getString(key);

  /// Sets the [value] associated with the [key].
  Future<bool> setString({
    required String key,
    required String value,
  }) async =>
      prefs.setString(key, value);

  /// Removes the value associated with the [key].
  Future<bool> remove(String key) async => prefs.remove(key);

  /// Removes all values except those in the [whiteList].
  Future<void> clear({
    List<String> whiteList = const [],
  }) async {
    for (final key in prefs.getKeys()) {
      if (!whiteList.contains(key)) {
        await prefs.remove(key);
      }
    }
  }

  /// Removes all values with the given [prefix].
  Future<void> clearOnlyKeysWithPrefix(
    String prefix,
  ) async {
    for (final key in prefs.getKeys()) {
      if (key.startsWith(prefix)) {
        await prefs.remove(key);
      }
    }
  }

  /// Returns the value associated with the [key] or null if it doesn't exist.
  bool? getBool(String key) => prefs.getBool(key);

  /// Sets the [value] associated with the [key].
  Future<bool> setBool({
    required String key,
    required bool value,
  }) =>
      prefs.setBool(key, value);

  /// Returns the value associated with the [key] or null if it doesn't exist.
  double? getDouble(String key) => prefs.getDouble(key);

  /// Sets the [value] associated with the [key].
  Future<bool> setDouble({
    required String key,
    required double value,
  }) =>
      prefs.setDouble(key, value);

  /// Returns all the keys in the storage.
  Set<String> getKeys() => prefs.getKeys();

  /// Returns the value associated with the [key] or null if it doesn't exist.
  Object? get(String key) => prefs.get(key);
}
