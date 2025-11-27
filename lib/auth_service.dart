import 'user_model.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() => _instance;

  AuthService._internal() {
    _registeredUsers.add(
      User(name: 'Test User', email: 'test@example.com', password: 'password'),
    );
  }

  User? _currentUser;
  final List<User> _registeredUsers = [];

  User? get currentUser => _currentUser;

  bool login(String email, String password) {
    for (var user in _registeredUsers) {
      if (user.email == email && user.password == password) {
        _currentUser = user;
        return true;
      }
    }
    return false;
  }

  bool register(User newUser) {
    if (newUser.email.isEmpty || newUser.password.isEmpty || newUser.name.isEmpty) {
      return false;
    }

    if (_registeredUsers.any((user) => user.email == newUser.email)) {
      return false;
    }

    _registeredUsers.add(newUser);
    return true;
  }

  void logout() => _currentUser = null;

  bool isLoggedIn() => _currentUser != null;
}
