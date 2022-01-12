import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ConfigApp extends HiveObject {

  @HiveField(0)
  late String Pathbackgroud;
}