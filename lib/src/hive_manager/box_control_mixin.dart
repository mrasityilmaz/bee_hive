part of '../../bee_hive.dart';

base mixin _BoxControlMixin implements _IHiveManagerInterface {
  ///
  /// List of boxes
  /// This list contains all the boxes which are required to be registered
  ///
  ///
  @override
  @protected
  List<HiveBoxService<Object>> boxes = List<HiveBoxService<Object>>.empty(growable: true);

  ///
  /// Get all boxes
  ///
  @override
  List<HiveBoxService<Object>> get allBoxes => boxes;

  ///
  /// Get the box by name
  ///
  @override
  HiveBoxService<T>? getBoxService<T>(String boxName) {
    return _findbox(boxName);
  }

  ///
  /// Add a box to the list
  /// It also registers the box with the adapter
  /// and initializes the box
  ///
  ///
  /// `box` is a HiveBoxService which is required to be registered
  ///

  @override
  void addBox<T>(HiveBoxService<T> box) {
    try {
      ///
      /// Add the box to the list
      ///
      boxes.add(box as HiveBoxService<Object>);

      box

        ///
        /// Register the adapter
        ///
        ..registerAdapter()

        ///
        /// Initialize the box
        ///
        ..initBox();
      //
      // End of the addBox
    } catch (e) {
      _LoggerService.instance.catchLog(e, StackTrace.current);
    }
  }

  ///
  /// Its only removes the box from the list
  /// It does not delete the box from disk
  ///
  ///
  @override
  void removeBox<T>(HiveBoxService<T>? boxService) {
    try {
      if (boxService == null) {
        return;
      }

      ///
      /// Remove the box from the list
      ///
      //

      boxService.box.close();
      boxes.removeWhere((element) => element.boxName == boxService.boxName);
      //
    } catch (e) {
      _LoggerService.instance.catchLog(e, StackTrace.current);
    }
  }

  ///
  /// Clear all boxes
  /// This will clear all the boxes from memory
  /// and will not delete the boxes from disk
  ///

  @override
  void clearAllBoxes({bool notify = true}) {
    try {
      for (final boxService in allBoxes) {
        boxService.box.clear(notify: notify);
      }

      _LoggerService.instance.printLog('All boxes cleared');
    } catch (e, s) {
      _LoggerService.instance.catchLog(e, s);
    }
  }

  ///
  /// Delete all boxes from disk
  /// This will delete all the boxes from disk
  ///

  @override
  void deleteAllBoxesFromDisk() {
    try {
      for (final boxService in allBoxes) {
        boxService.box
          ..clear()
          ..close();

        if (kDebugMode || kProfileMode || kReleaseMode) {
          boxService.box.deleteFromDisk();
        }
      }

      boxes.clear();

      _LoggerService.instance.printLog('All boxes deleted from disk');
    } catch (e, s) {
      _LoggerService.instance.catchLog(e, s);
    }
  }

  ///
  /// Get the box by name
  ///
  HiveBoxService<T>? _findbox<T>(String boxName) {
    return allBoxes.firstWhereOrNull((element) => element.boxName == boxName) as HiveBoxService<T>?;
  }
}
