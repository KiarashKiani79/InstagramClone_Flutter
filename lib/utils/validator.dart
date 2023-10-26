class MyValidators {
// Name validator
  static String? displayNamevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display name cannot be empty';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      return 'Display name must be between 3 and 20 characters';
    }

    return null;
  }

// Email validator
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter an email!';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please enter a valid email!';
    }
    return null;
  }

// Password validator
  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password!';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long!';
    }
    return null;
  }

// Confirm password validator
  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'Passwords do not match!';
    }
    return null;
  }

// Phone number validator
  static String? phoneNumberValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number!';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number!';
    }
    return null;
  }

// Age validator
  static String? ageValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your age!';
    }
    int? age = int.tryParse(value);
    if (age == null || age < 18) {
      return 'You must be at least 18 years old!';
    }
    return null;
  }

// Username validator
  static String? usernameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a username!';
    }
    if (value.length < 4 || value.length > 20) {
      return 'Username must be between 4 and 20 characters!';
    }
    return null;
  }

// Address validator
  static String? addressValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your address!';
    }
    return null;
  }

// Description validator
  static String? descriptionValidator(String? value, String? label) {
    if (value!.isEmpty) {
      return 'Please enter a $label!';
    }
    if (value.length < 10 || value.length > 200) {
      return '$label must be between 10 and 200 characters!';
    }
    return null;
  }

// Bio validator
  static String? bioValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a bio!';
    }
    if (value.length < 10 || value.length > 200) {
      return 'Bio must be between 10 and 200 characters!';
    }
    return null;
  }
}
