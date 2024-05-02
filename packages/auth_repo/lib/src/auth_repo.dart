import 'dart:async';

import 'package:auth_repo/src/models/user.dart';
import 'package:cache/cache.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    final CacheClient? cache,
  }) : _cache = cache ?? CacheClient() {
    _cache.changes.listen((event) {
      if (event is User || event == null) {
        _userController.add(event);
      }
    });
  }

  CacheClient _cache;

  CacheClient get cache => _cache;

 

  User? get currentUser => _cache.read<User?>(key: 'user');

 final StreamController<User?> _userController = StreamController<User?>.broadcast();
  Stream<User?> get user => _userController.stream;

// allows us to write null to user key in cache
  void setUser(User? user) {
    cache.write<User?>(key: 'user', value: user);
  }

  void dispose() {
    _cache.dispose();
    _userController.close();
  }
}
