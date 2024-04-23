extension StringExt on String {
  bool isValidEmail() {
    final emailRegX = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegX.hasMatch(this);  //to return true if email validation is correct
  }
}