import 'package:flutter_application_2/models/user_model.dart';

abstract class AuthState {
  final Map<String, String> emails;

  AuthState(this.emails);
}

class AuthInitial extends AuthState {
  AuthInitial(super.emails);
}

class AuthLoginSuccess extends AuthState {
  
  AuthLoginSuccess(super.emails);
}

class AuthRemmemberd extends AuthState {
  final bool isRememmberd;
  AuthRemmemberd(super.emails, this.isRememmberd);
}

class AuthRegisterd extends AuthState {
  AuthRegisterd(super.emails, UserModel user);
}

class AuthLoding extends AuthState {
  AuthLoding(super.emails);
}

class AuthError extends AuthState {
  AuthError(super.emails, String massage, String faild);
}

class AuthLoggedOut extends AuthState {
  AuthLoggedOut(super.emails);
}

class AuthValidationError extends AuthState {
  AuthValidationError(super.emails, Map errors);
}
