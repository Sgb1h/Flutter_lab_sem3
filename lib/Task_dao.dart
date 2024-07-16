import 'package:floor/floor.dart';
import 'Task.dart';

@dao
abstract class TaskDao {
  @Query('SELECT * FROM Task')
  Future<List<Task>> findAllTasks();

  @insert
  Future<void> insertTask(Task task);

  @delete
  Future<void> deleteTask(Task task);
}
