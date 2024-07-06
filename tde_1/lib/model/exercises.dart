final String tableExercises = 'exercises';

class ExercisesFields {
  static final String id = '_id';
  static final String name = 'name';
  static final String muscle = 'muscle';
}

class Exercises {
  int? id;
  String? name;
  String? muscle;

  Exercises({
    this.id,
    this.name,
    this.muscle,
  });

  Exercises copy({
    int? id,
    String? name,
    String? muscle,
  }) =>
      Exercises(
        id: id ?? this.id,
        name: name ?? this.name,
        muscle: muscle ?? this.muscle,
      );

  static Exercises fromJson(Map<String, Object?> json) => Exercises(
        id: json[ExercisesFields.id] as int?,
        name: json[ExercisesFields.name] as String?,
        muscle: json[ExercisesFields.muscle] as String?,
      );

  Map<String, Object?> toMap() {
    return {
      ExercisesFields.id: id,
      ExercisesFields.name: name,
      ExercisesFields.muscle: muscle,
    };
  }

  @override
  String toString() {
    return 'Exercises { name: $name, muscle: $muscle}';
  }
}
