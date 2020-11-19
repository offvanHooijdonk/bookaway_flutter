
class UserModel {
  int id;
  String email;

  UserModel(this.id, this.email);

  @override
  bool operator ==(Object other) {
    return other is UserModel && other.id == this.id;
  }

  @override
  int get hashCode => id;

}

class Session {
  static final Session _singleton = Session._internal();

  factory Session() {
    return _singleton;
  }

  Session._internal();

  UserModel currentUser = UserModel(1, "yahor.fralou@itechart-group.com");
}