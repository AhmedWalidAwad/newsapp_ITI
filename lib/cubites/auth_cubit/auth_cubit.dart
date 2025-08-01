import 'package:dio/dio.dart';
import 'package:flutter_application_2/cubites/auth_cubit/auth_state.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:flutter_application_2/servieses/local_storage_servies.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial({})) {
    _initialize();
  }

  Future<void> _initialize() async {
    final emails = await LocalStorageService.loadEmails();
    final isRemembered = await LocalStorageService.loadRemembered();
    emit(AuthInitial(emails)); // تحديث الـ state بالإيميلات المحملة
  }

 void login(String email, bool rememperMe, String password) async {
  emit(AuthLoding(state.emails)); 
  final emails = await LocalStorageService.loadEmails();
  
  if (emails.containsKey(email) && emails[email] == password) {
    emit(AuthLoginSuccess(emails));
    await LocalStorageService.saveRemembered(rememperMe);
    await LocalStorageService.saveEmails(emails);
  } else {
    emit(AuthError(emails, "Login failed", "Invalid email or password"));
  }
}

  void remmberd(bool rem) {
    emit(AuthRemmemberd(state.emails, rem));
  }

  void register(UserModel user) async {
    Map<String, String> existingEmails = await LocalStorageService.loadEmails();

    existingEmails[user.email] = user.password;

    emit(AuthRegisterd(existingEmails, user));

    await LocalStorageService.saveEmails(existingEmails);
  }

  void logOut() {}

  void checkAuthState() {}

  void validateForm(FormData formData) {}

  void updateProfile(UserModel user) {}

  void changePassword(String oldPass, String newPass) {}
}
