import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class movieModel{

  @HiveField(0)
  late String movieName;

  @HiveField(1)
  late String directorName;
}