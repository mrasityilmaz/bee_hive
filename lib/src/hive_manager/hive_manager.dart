part of '../../../bee_hive.dart';

///
/// HiveService
///
/// This class basically help your Hive things to be managed
///
///
///
/// You can use this function in the main function of your application
/// or you can inject with dependency injection to use it in your application
///
///
///

final class HiveManager with _BoxControlMixin, _BoxRegisterHelperMixin {
  ///
  factory HiveManager() {
    return instance;
  }

  HiveManager._internal();

  ///
  static HiveManager instance = HiveManager._internal();

  static bool _isInitialized = false;

  ///
  ///
  /// Initialize HiveService
  ///
  /// This function initializes Isar, Hive and registers and initializes all boxes
  ///
  /// `boxes` is a list of HiveBoxService which are required to be registered
  ///
  /// `dir` is a directory where the Hive database will be stored
  ///
  /// `isarLibPath` is a directory where the Isar libraries are stored (only for Dart-only apps or unit tests)
  /// #### Note: Do not provide isarLibPath if you are not developing a Dart-only app or unit tests
  ///
  @override
  Future<void> init({required List<HiveBoxService<Object>> hiveBoxes, Directory? dir, Directory? isarLibPath}) async {
    if (_isInitialized) {
      throw Exception('HiveManager is already initialized \n'
          'You can only initialize HiveManager once\n'
          'If you want to add more boxes, you can add them using the addBox function');
    }

    final appDocumentDir = dir ?? await getApplicationDocumentsDirectory();

    ///
    /// Default directory for Hive
    ///
    Hive.defaultDirectory = appDocumentDir.path;

    ///
    /// Add all boxes to the list
    ///
    boxes.addAll(hiveBoxes);

    ///
    /// Register all boxes which require to be registered
    /// with their respective adapters
    ///

    registerAllNonPrimitiveBoxes();

    ///
    /// Initialize all boxes
    ///

    initializeAllBoxes();

    ///
    /// Set Initialized
    ///
    setInitialized();
    // End of the Init
  }

  ///
  /// Set Initialized
  ///
  @protected
  @override
  void setInitialized() {
    _isInitialized = true;
  }
}
