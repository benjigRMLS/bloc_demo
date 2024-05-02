import 'dart:async';

import 'package:auth_repo/auth_repo.dart'
    show
        User; // not a great idea in a real app. cache should operate independently of other packages

class CacheClient {
  // as soon as the chache is created, add a user
  CacheClient()
      : _cache = <String, Object?>{
          'user': User(name: 'Benji', email: 'benji@gmail.com')
        };

  final Map<String, Object?> _cache;

  final StreamController<dynamic> _controller = StreamController<dynamic>.broadcast();

  Stream<dynamic> get changes => _controller.stream;

  void write<T extends Object?>({required String key, required T? value,}) {
    _cache[key] = value;
    _controller.add(value);
  }

  T? read<T extends Object?>({required String key}) {
    final value = _cache[key];
    if (value is T) return value;
    return null;
  }

  void dispose() {
    _controller.close();
  }
}
