part of '../../bee_hive.dart';

///
/// This class is used to create a HiveManager
/// and to extend the functionality of the HiveManager.
///
abstract interface class _IHiveManagerInterface {
  late final List<HiveBoxService<Object>> boxes;
  List<HiveBoxService<Object>> get allBoxes;
  Future<void> init({required List<HiveBoxService<Object>> hiveBoxes, Directory? dir, Directory? isarLibPath});
  HiveBoxService<T>? getBoxService<T>(String boxName);
  void addBox<T>(HiveBoxService<T> box);
  void removeBox<T>(HiveBoxService<T> boxService);
  void clearAllBoxes({bool notify = true});
  void deleteAllBoxesFromDisk();

  void registerAllNonPrimitiveBoxes();

  void initializeAllBoxes();

  void setInitialized();
}
