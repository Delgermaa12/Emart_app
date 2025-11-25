// lib/auth_service.dart
import 'user_model.dart';

class AuthService {
  // Singleton instance
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal() {
    // Initialize with demo users
    _registeredUsers.add(
      User(name: 'Test User', email: 'test@example.com', password: 'password'),
    );
  }

  User? _currentUser;
  final List<User> _registeredUsers = [];

  User? get currentUser => _currentUser;

  bool login(String email, String password) {
    // Check in registered users
    for (var user in _registeredUsers) {
      if (user.email == email && user.password == password) {
        _currentUser = user;
        print('Login successful: $email');
        return true;
      }
    }

    print('Login failed: $email');
    print('Registered users: ${_registeredUsers.map((u) => u.email).toList()}');
    return false;
  }

  bool register(User newUser) {
    // Validate input
    if (newUser.email.isEmpty || newUser.password.isEmpty || newUser.name.isEmpty) {
      return false;
    }

    // Check if email already exists
    if (_registeredUsers.any((user) => user.email == newUser.email)) {
      return false;
    }

    // Add new user to registered users list
    _registeredUsers.add(newUser);
    print('User registered: ${newUser.email}');
    print('All users: ${_registeredUsers.map((u) => u.email).toList()}');
    return true;
  }

  void logout() {
    _currentUser = null;
  }

  bool isLoggedIn() {
    return _currentUser != null;
  }
}