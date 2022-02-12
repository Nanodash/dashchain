enum RequestMethod {
  get,
  post,
}

extension RequestMethodAsString on RequestMethod {
  String get value {
    switch (this) {
      case RequestMethod.get:
        return 'GET';
      case RequestMethod.post:
        return 'POST';
    }
  }
}
