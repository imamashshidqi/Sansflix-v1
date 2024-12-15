class User {
  String username;
  String password;

  User({required this.username, required this.password});
}

class Admin extends User {
  String role;

  Admin({required super.username, required super.password, required this.role});
}

Admin admin = Admin(username: 'admin', password: 'admin123', role: 'Admin');
