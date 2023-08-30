// the class is used to handle the error in the application
class Failure implements Exception {
  final String message;

  Failure({required this.message});
}
