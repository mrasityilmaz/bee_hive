part of '../../bee_hive.dart';

///
/// IHiveBoxService<E> service implementation
///
sealed class _HiveBoxServiceImpl<T> implements IHiveBoxService<T> {
  _HiveBoxServiceImpl({
    required this.boxName,
    T Function(Map<String, dynamic> json)? fromJson,
  }) : _fromJson = fromJson {
    ///
    /// [E] has to be a class that can be serialized and deserialized.
    ///

    if (!_isSupportedType<T>() && (_fromJson == null)) {
      throw ArgumentError('Non-primitive and non-Hive supported types must provide fromJson and toJson functions');
    }
  }

  @override
  @nonVirtual
  Box<T> get box => Hive.box<T>(name: boxName);

  @override
  @nonVirtual
  final String boxName;

  @override
  void initBox() {
    try {
      // Open the box with the name [boxName].
      Hive.box<T>(name: boxName);
    } catch (e, s) {
      // Catch and log the error.
      _LoggerService.instance.catchLog(e, s);
    }
  }

  ///
  /// [T] has to be a class that can be serialized and deserialized.
  ///
  /// Just Ignore if [T] is a primitive type
  ///
  @override
  final T Function(Map<String, dynamic> json)? _fromJson;

  ///
  /// Check if the type is supported by Hive.
  ///
  ///
  @nonVirtual
  bool _isSupportedType<E>() {
    // Check if the type is supported by Hive.
    return E == int || E == double || E == String || E == bool || E == Uint8List || _isMap<E>();
  }

  @nonVirtual
  bool _isMap<E>() {
    return E == (Map<String, dynamic>);
  }

  ///
  /// Register the adapter
  ///
  /// Hive don't allow to register adapter for dynamic types
  /// so we have to check if the type is supported by Hive
  /// and then register the adapter
  ///
  ///
  @override
  void registerAdapter() {
    try {
      if (_fromJson == null) {
        return;
      }
      Hive.registerAdapter<T>(
        boxName,
        (json) => _fromJson(json as Map<String, dynamic>),
      );
    } catch (e, s) {
      _LoggerService.instance.catchLog(e, s);
    }
  }

  ///
  ///
}
