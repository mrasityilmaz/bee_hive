part of '../../../bee_hive.dart';

///
/// This class is used to create a Hive Box Service
/// with a keySelector function to get the key of the element
/// in the box.
/// It is used to perform operations on a specific Hive box.
/// It is used to interact with a Hive box.
/// It is used to perform operations on the Hive box.
///
/// Implementations of this class are used to interact with a specific Hive box.
///
/// Or you can use your own implementation of this class.
///
/// You can add your own functions to this class.
/// But careful with the functions that are already implemented.
/// They are used to interact with the Hive box.
/// #### You can override them if you want to change their behavior.
/// #### But be careful, as this may cause unexpected behavior.

class HiveBoxService<T> extends _HiveBoxServiceImpl<T> {
  ///
  /// Required boxName
  ///
  /// ``boxName``,
  ///
  /// Required if [T] is not a primitive type
  ///
  /// ``fromJson``,
  ///
  ///
  HiveBoxService({
    required super.boxName,
    super.fromJson,
  });
}
