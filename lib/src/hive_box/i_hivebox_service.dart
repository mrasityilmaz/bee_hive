// ignore_for_file: strict_raw_type

part of '../../bee_hive.dart';

///
/// Top-Level Hive.Box<E> service interface
///
/// It contains all useful capabilities
///
/// That just help to improve using Boxes
///
abstract interface class IHiveBoxService<T> {
  /// Represents a service for interacting with a Hive box.
  ///
  /// Use this service to perform operations on a specific Hive box identified by `boxName`.
  ///
  ///
  /// Required `boxName`
  ///
  /// `fromJson`,
  ///
  /// Non-Required just check `T` is JsonSerializable or not
  ///
  /// `toJson`
  ///
  ///
  IHiveBoxService({
    required this.boxName,
    T Function(Map<String, dynamic> json)? fromJson,
  }) : _fromJson = fromJson;

  ///
  /// `T` has to be a class that can be serialized and deserialized.
  ///
  /// The `_fromJson` method is used to deserialize the JSON object.
  /// and this method is required for adapter registration.
  ///
  // Ignore unused field linter warn bc it is private and used in the implementation
  // ignore: unused_field
  final T Function(Map<String, dynamic> json)? _fromJson;

  /// The name of the Hive box.
  ///
  /// It is used to identify the box in the Hive database.
  /// If no `boxName` is specified, the default directory name is used.
  final String boxName;

  /// The Hive box that this service interacts with.
  /// It is initialized in the `_initBox` method.
  /// It is used to perform operations on the Hive box.
  Box<T> get box;

  ///
  /// Initialize the box with the name `boxName`.
  /// Type of the box is `T`.
  /// Comes with a default implementation.
  ///
  ///
  /// If an error occurs, it is caught and logged.
  ///
  void initBox() {}

  ///
  /// Hive register adapter dont accept dynamic type
  /// so we have to register the adapter manually
  /// for each box
  ///
  void registerAdapter() {}
}
