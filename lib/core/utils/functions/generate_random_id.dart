import 'dart:math' show Random;

String generateRandomId([int length = 12]) {
  const chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final rand = Random.secure();

  return List.generate(length, (_) => chars[rand.nextInt(chars.length)]).join();
}
