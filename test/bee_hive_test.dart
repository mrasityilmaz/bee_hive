import 'dart:io';

import 'package:bee_hive/bee_hive.dart';
import 'package:flutter_test/flutter_test.dart';

// import 'package:isar/isar.dart';

import 'isar_lib_path.dart';
import 'test_models/test_cache_model.dart';

Future<void> main() async {
  final dir = Directory.systemTemp;

  ///
  /// Path to isar_lib
  /// If you are testing, you must provide the path to the isar_lib
  ///
  /// For example, if you are testing on MacOS, you can provide the path to the isar_lib_macos.dylib
  ///
  /// However, i have provided all the paths for all the platforms
  ///
  final isarLibPath = Directory(getIsarLibPath);

  ///
  /// Initialize Isar
  ///
  // await Isar.initialize(getIsarLibPath);

  ///
  /// Instance of HiveManager
  /// ### BeeHive
  ///
  final hiveManager = HiveManager.instance;

  ///
  /// Example Primitive Type Boxes
  ///
  /// These are only Primitive Type Boxes
  ///
  final primitiveTypeBoxes = <HiveBoxService<Object>>[
    ///
    /// int Box
    ///
    HiveBoxService<int>(
      boxName: 'int',
    ),

    ///
    /// String Box
    ///
    HiveBoxService<String>(
      boxName: 'string',
    ),

    ///
    /// double Box
    ///
    HiveBoxService<double>(
      boxName: 'double',
    ),

    ///
    /// bool Box
    ///
    HiveBoxService<bool>(
      boxName: 'bool',
    ),
  ];

  ///
  /// Example Non-Primitive Type Boxes
  ///
  /// These are Non-Primitive Type Boxes
  ///
  /// These boxes not different from the Primitive Type Boxes
  /// just these boxes have a fromJson function
  ///
  final nonPrimitiveBoxes = <HiveBoxService<Object>>[
    ///
    /// CacheModel Box
    ///
    HiveBoxService<CacheModel>(
      boxName: 'cacheModel',
      fromJson: CacheModel.fromJson,
    ),

    ///
    /// OtherCacheModel Box
    ///
    HiveBoxService<OtherCacheModel>(
      boxName: 'otherCacheModel',
      fromJson: OtherCacheModel.fromJson,
    ),
  ];

  ///
  /// Initialize HiveManager with Primitive Type Boxes
  ///
  hiveManager.init(
    dir: dir,
    isarLibPath: isarLibPath,

    ///
    /// Test Boxes
    ///
    hiveBoxes: [...primitiveTypeBoxes, ...nonPrimitiveBoxes],
  );

  group('Primitive Type Boxes', () {
    test('int Box Test', () {
      final boxService = hiveManager.getBoxService<int>('int');
      expect(boxService, isNotNull);

      boxService!.box.put('int', 1);

      expect(boxService.box.get('int'), 1);

      boxService.box.delete('int');

      expect(boxService.box.get('int'), isNull);
    });

    test('String Box Test', () {
      final boxService = hiveManager.getBoxService<String>('string');
      expect(boxService, isNotNull);

      boxService!.box.put('string', 'string');

      expect(boxService.box.get('string'), 'string');

      boxService.box.delete('string');

      expect(boxService.box.get('string'), isNull);
    });

    test('double Box Test', () {
      final boxService = hiveManager.getBoxService<double>('double');
      expect(boxService, isNotNull);

      boxService!.box.put('double', 1);

      expect(boxService.box.get('double'), 1.0);

      boxService.box.delete('double');

      expect(boxService.box.get('double'), isNull);
    });

    test('bool Box Test', () {
      final boolService = hiveManager.getBoxService<bool>('bool');
      expect(boolService, isNotNull);

      boolService!.box.put('bool', true);

      expect(boolService.box.get('bool'), true);

      boolService.box.delete('bool');

      expect(boolService.box.get('bool'), isNull);
    });
  });

  group('Non-Primitive Type Boxes', () {
    test('CacheModel Box Test', () {
      final boxService = hiveManager.getBoxService<CacheModel>('cacheModel');
      expect(boxService, isNotNull);

      final cacheModel = CacheModel(data: 'data', isCached: true);

      boxService!.box.put('cacheModel', cacheModel);

      expect(boxService.box.get('cacheModel')?.data, cacheModel.data);

      expect(boxService.box.get('cacheModel')?.isCached, cacheModel.isCached);

      boxService.box.delete('cacheModel');

      expect(boxService.box.get('cacheModel'), isNull);
    });

    test('OtherCacheModel Box Test', () {
      final boxService = hiveManager.getBoxService<OtherCacheModel>('otherCacheModel');
      expect(boxService, isNotNull);

      final otherCacheModel = OtherCacheModel(data: 'data', isCached: true, id: 1);

      boxService!.box.put('otherCacheModel', otherCacheModel);

      expect(boxService.box.get('otherCacheModel')?.data, otherCacheModel.data);

      expect(boxService.box.get('otherCacheModel')?.isCached, otherCacheModel.isCached);

      boxService.box.delete('otherCacheModel');

      expect(boxService.box.get('otherCacheModel'), isNull);
    });
  });

  group('HiveManager', () {
    test('All Boxes Test', () {
      final allBoxes = hiveManager.allBoxes;

      expect(allBoxes.length, 6);
    });

    /// add box
    test('Add Box Test', () {
      /// First add the box
      ///
      hiveManager.addBox(HiveBoxService<int>(boxName: 'addInt'));

      final box = hiveManager.getBoxService<int>('addInt');

      expect(box, isNotNull);

      expect(hiveManager.allBoxes.length, 7);

      hiveManager.removeBox(box);

      expect(hiveManager.allBoxes.length, 6);
    });

    test('Remove Box Test', () {
      final box = hiveManager.getBoxService<int>('int');
      hiveManager.removeBox(box);

      final deletedBoxService = hiveManager.getBoxService<int>('int');

      expect(deletedBoxService, isNull);
    });

    test('Clear All Boxes Test', () {
      hiveManager.clearAllBoxes(notify: false);

      for (final boxService in hiveManager.allBoxes) {
        expect(boxService.box.isEmpty, true);
      }
    });

    test('Delete All Boxes From Disk Test', () {
      hiveManager.deleteAllBoxesFromDisk();

      final allBoxes = hiveManager.allBoxes;

      expect(allBoxes.length, 0);
    });
  });
}
