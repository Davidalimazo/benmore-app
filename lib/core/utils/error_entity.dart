class ErrorEntity implements Exception {
  int code = -1;
  dynamic message = "";

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == null) {
      return "Exception";
    // ignore: curly_braces_in_flow_control_structures
    } else if (message == "") return "Exception";

    return "$message";
  }
}