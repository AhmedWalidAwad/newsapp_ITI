class Validation {
  validationEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (email.isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter a value';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain at least one number';
    }

    if (!RegExp(r'[!@#\$&*~%^+=_\-]').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }

    return null; // valid
  }

  validateName(String name) {
    if (name.isEmpty) {
      return 'Name cannot be empty';
    } else if (name.length < 2) {
      return 'Name must be at least 2 characters long';
    }
    return null;
  }

  validatePhoneNumber(String phoneNumber) {
    final phoneRegex = RegExp(r'^\+?[0-9]{11}$');
    if (!phoneRegex.hasMatch(phoneNumber)) {
      return 'Invalid phone number format';
    }
    return null;
  }

  validatAge(DateTime? dateOfBirth) {
    if (dateOfBirth == null) {
      return 'Date of birth cannot be empty';
    }
    final today = DateTime.now();
    final age = today.year - dateOfBirth.year;
    if (age < 18) {
      return 'You must be at least 18 years old';
    }
    return null;
  }
}
