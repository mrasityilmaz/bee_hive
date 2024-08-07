// ignore_for_file: cascade_invocations, avoid_redundant_argument_values, lines_longer_than_80_chars, omit_local_variable_types, unused_local_variable

import 'package:bee_hive/bee_hive.dart';
import 'package:flutter/foundation.dart';

import '../test/test_models/test_cache_model.dart';

Future<void> main() async {
  ///
  /// You can call the instance from anywhere in your application
  ///
  /// but make sure before using the instance, you have initialized the HiveManager and all the boxes
  ///
  final hiveManager = HiveManager.instance;

  await hiveManager.init(
    ///
    /// ## Required - If you want to use Hive in your application
    ///
    /// Your Hive boxes that you want to use in your application
    ///
    ///
    hiveBoxes: [
      HiveBoxService<String>(boxName: 'TestBox'),
      // CacheModel is an example model - you can replace it with your own model which has a fromJson method
      HiveBoxService<CacheModel>(boxName: 'TestBox2', fromJson: CacheModel.fromJson),
    ],

    /// ## NonRequired
    /// Directory where the Hive database will be stored
    /// defult is getApplicationDocumentsDirectory()
    ///
    dir: null,

    /// ## Unnecessary for Flutter apps
    /// ## Only for Dart-only apps or unit tests
    /// Directory where the Isar libraries are stored
    ///
    isarLibPath: null,
  );

  ///
  /// You can call allBoxes to get all the boxes that you have registered
  ///
  hiveManager.allBoxes;

  ///
  /// You can call getBox to get a specific box
  ///
  /// `getBoxService<T>` returns a HiveBoxService<T> object
  ///
  /// `T` is the type of the box
  ///
  /// `boxName` is the name of the box
  ///
  /// `getBoxService<T>` returns null if the box is not found
  ///
  /// HiveBoxService<T> is a service for interacting with a Hive box
  ///
  /// Provides all useful capabilities that help to improve using boxes
  ///
  /// Just define a HiveBoxService<T> object and use it to perform operations on a specific Hive box
  ///
  final HiveBoxService<String> testBoxService = hiveManager.getBoxService<String>('TestBox')!;

  ///
  /// `testBoxService.box` is a Hive box
  ///
  testBoxService.box.add('Hello World');

  debugPrint(testBoxService.box.getAt(0)); // Hello World

  ///
  /// You can add more boxes after initializing the HiveManager
  ///
  hiveManager.addBox(HiveBoxService<int>(boxName: 'int'));

  ///
  /// Also, you can remove a box from the list
  ///
  hiveManager.removeBox(hiveManager.getBoxService<int>('int'));

  ///
  /// Clear all boxes
  ///
  hiveManager.clearAllBoxes();

  ///
  /// Delete all boxes from disk
  ///
  hiveManager.deleteAllBoxesFromDisk();
}
