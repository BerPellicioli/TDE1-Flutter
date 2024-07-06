final String tableUser = 'users';

class UserFields {
  static final List<String> values = [id, username, password];
  static final String id = '_id';
  static final String username = 'username';
  static final String password = 'password';
  static final String tableUser = 'users';
}

class User {
  int? id;
  String? username;
  String? password;

  User({
    this.id,
    required this.username,
    required this.password,
  });

  User copy({
    int? id,
    String? username,
    String? password,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
      );

  static User fromMap(Map<String, Object?> map) => User(
        id: map[UserFields.id] as int?,
        username: map[UserFields.username] as String?,
        password: map[UserFields.password] as String?,
      );

  Map<String, Object?> toMap() {
    return {
      UserFields.id: id,
      UserFields.username: username,
      UserFields.password: password,
    };
  }

  @override
  String toString() {
    return 'User { id: $id, username: $username, password: $password }';
  }
}
