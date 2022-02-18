/// The enum for the possible types of an order's response
/// From docs :
/// `Set the response JSON. ACK, RESULT, or FULL; MARKET and LIMIT order types default to FULL, all other orders default to ACK.`
enum OrderResponseType {
  ack,
  result,
  full,
}

extension OrderResponseTypeAsString on OrderResponseType {
  String get value {
    switch (this) {
      case OrderResponseType.ack:
        return 'ACK';
      case OrderResponseType.result:
        return 'RESULT';
      case OrderResponseType.full:
        return 'FULL';
    }
  }
}
