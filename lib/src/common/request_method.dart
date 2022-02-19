enum RequestMethod {
  get,
  post,
  delete,
}

extension RequestMethodAsString on RequestMethod {
  String get value {
    switch (this) {
      case RequestMethod.get:
        return 'GET';
      case RequestMethod.post:
        return 'POST';
      case RequestMethod.delete:
        return 'DELETE';
    }
  }
}
