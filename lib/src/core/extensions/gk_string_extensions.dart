extension Validations on String {
  bool isValidEmail() {
    return RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(this);
  }

  bool isValidPhone() {
    return length == 10;
  }

  bool isValidPassword() {
    // Minimum eight characters, at least one letter, one number and one special character:
    return RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$").hasMatch(this);
  }

  String? nameValidator() {
    if (isEmpty || length < 3) {
      return "Name requires a minimum of three letters.";
    } else if (!RegExp(r"^[A-Za-z]").hasMatch(this[0])) {
      return "Name should start with an alphabet";
    }
    return null;
  }

  String? emailValidator() {
    if (!isValidEmail()) {
      return "Please enter a valid email";
    }
    return null;
  }

  String? passwordValidator() {
    if (!isValidPassword()) {
      return "Please enter a valid password";
    }
    return null;
  }

  String capitalize() {
    if (isEmpty) {
      return this;
    }

    if (length == 1) {
      return toUpperCase();
    }

    return this[0].toUpperCase() + substring(1);
  }

  String getInitials() {
    if (length > 1) {
      List<String> parts = split(' ').where((val) => val.isNotEmpty).toList();
      if (parts.length > 1) {
        return parts[0][0].toUpperCase() + parts[1][0].toUpperCase();
      }
      return substring(0, 2).toUpperCase();
    }
    return this;
  }
}
