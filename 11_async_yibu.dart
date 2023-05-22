// This example shows how *not* to write asynchronous Dart code.
//synchronous operation: A synchronous operation blocks other operations from executing until it completes.
//synchronous function: A synchronous function only performs synchronous operations.
//asynchronous operation: Once initiated, an asynchronous operation allows other operations to execute before it completes.
//asynchronous function: An asynchronous function performs at least one asynchronous operation and can also perform synchronous operations.
String createOrderMessage() {
  var order = fetchUserOrder();
  return 'Your order is: $order';
}
Future<void> fetchUserOrder2() {
  // Imagine that this function is fetching user info from another service or database.
  return Future.delayed(const Duration(seconds: 2), () => print('Large Latte'));
}
Future<String> fetchUserOrder() =>
    // Imagine that this function is more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );


//Example: synchronous functions
String createOrderMessage3() {
  var order = fetchUserOrder3();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder3() =>
    // Imagine that this function is
    // more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );

Future<void> printOrderMessage() async {
  print('Awaiting user order...');
  var order = await fetchUserOrder4();
  print('Your order is: $order');
}

Future<String> fetchUserOrder4() {
  // Imagine that this function is more complex and slow.
  return Future.delayed(const Duration(seconds: 4), () => 'Large Latte');
}

// You can ignore this function - it's here to visualize delay time in this example.
void countSeconds(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}
void main() {
  print(createOrderMessage());
  fetchUserOrder2();
  print('Fetching user order...');
  print(createOrderMessage3());
  countSeconds(4);
}