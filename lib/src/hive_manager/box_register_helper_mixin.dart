part of '../../bee_hive.dart';

mixin _BoxRegisterHelperMixin on _IHiveManagerInterface {
  ///
  ///
  /// Register all boxes
  ///
  @override
  @protected
  void registerAllNonPrimitiveBoxes() {
    try {
      for (final box in allBoxes) {
        ///
        /// Init the box if type is Primitive or Hive Supported
        ///
        if (box._fromJson == null) {
          continue;
        } else {
          ///
          /// Register the adapter
          ///
          box.registerAdapter();
        }
      }
    } catch (e, s) {
      _LoggerService.instance.catchLog(e, s);
    }
  }

  ///
  ///
  /// Initialize all boxes
  ///
  @override
  @protected
  void initializeAllBoxes() {
    try {
      for (final box in allBoxes) {
        ///
        /// Init Box
        ///
        box.initBox();
      }
    } catch (e, s) {
      _LoggerService.instance.catchLog(e, s);
    }
  }
}
