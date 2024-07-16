import 'package:floor/floor.dart';

@entity
class Task {
  @primaryKey
  final int id;
  final String name;

  Task(this.id, this.name);
}
