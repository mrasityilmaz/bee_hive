// ignore_for_file: depend_on_referenced_packages

library bee_hive;

import 'dart:io';

import 'package:bee_hive/src/extensions/list_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

part 'src/helper/_logger.dart';
part 'src/hive_box/hive_box_service.dart';
part 'src/hive_box/i_hivebox_service.dart';
part 'src/hive_box/impl_hivebox_service.dart';
part 'src/hive_manager/box_control_mixin.dart';
part 'src/hive_manager/box_register_helper_mixin.dart';
part 'src/hive_manager/hive_manager.dart';
part 'src/hive_manager/i_hive_manager.dart';
