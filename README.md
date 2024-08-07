[![BeeHive](https://raw.githubusercontent.com/mrasityilmaz/bee_hive/main/preview.png)](https://devrasityilmaz.com)

### BeeHive 

BeeHive helps manage Boxes and register adapters easily for Hive 4.x.x.
It simplifies Box management and adapter registration, making Hive usage more efficient.


### Features 🌟

- 📦 Box management: Easily manage Boxes for Hive 4.x.x.
- 🔌 Adapter registration: Simplify the process of registering adapters.
- 🚀 Efficient operations: Streamline database operations with intuitive tools.
- 🔐 Queen's Guard: Encryption built right in.
- 🛠️ User-friendly enhancements: Tools to make Hive even more powerful and easy to use.




#### 🔗 Add dependencies

To use this package, add `bee_hive` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  bee_hive : ^0.0.1
```

#### 🏁 And... Action!

Woohoo! You're all set. Jump in and let your BeeHive adventure begin!

```dart
import 'package:bee_hive/bee_hive.dart';

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
```


### 📜 License

```
MIT License

Copyright (c) 2024 Muhammed Raşit Yılmaz 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

