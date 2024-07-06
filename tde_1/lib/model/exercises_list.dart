final String tableExercisesList = 'exercises_list';

class ExercisesListFields {
  static final String id = '_id';
  static final String username = 'username';
  static final String exercises = 'exercises';
}

class ExercisesList {
  int? id;
  String? username;
  String? exercises;

  ExercisesList({
    this.id,
    this.username,
    this.exercises,
  });

  ExercisesList copy({
    int? id,
    String? username,
    String? exercises,
  }) =>
      ExercisesList(
        id: id ?? this.id,
        username: username ?? this.username,
        exercises: exercises ?? this.exercises,
      );

  static ExercisesList fromJson(Map<String, Object?> json) => ExercisesList(
        id: json[ExercisesListFields.id] as int?,
        username: json[ExercisesListFields.username] as String?,
        exercises: json[ExercisesListFields.exercises] as String?,
      );

  Map<String, Object?> toMap() {
    return {
      ExercisesListFields.id: id,
      ExercisesListFields.username: username,
      ExercisesListFields.exercises: exercises,
    };
  }

  @override
  String toString() {
    return 'ExercisesList { username: $username, id: $id}';
  }
}
