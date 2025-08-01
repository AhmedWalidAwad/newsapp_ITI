import 'package:flutter/material.dart';
import 'package:flutter_application_2/Screens/login_screan.dart';
import 'package:flutter_application_2/cubites/auth_cubit/auth_cubit.dart';
import 'package:flutter_application_2/cubites/auth_cubit/auth_state.dart';
import 'package:flutter_application_2/models/user_model.dart';
import 'package:flutter_application_2/utils/validation_utils.dart';
import 'package:flutter_application_2/widgets/date_selector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isRememberd = false;
  Validation valid = Validation();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController phonNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.tealAccent,
                borderRadius: BorderRadius.circular(30),
              ),

              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                            label: Text("Enter Your First Name"),
                          ),
                          validator: (value) {
                            return valid.validateName(value!);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                            label: Text("Enter Your last Name"),
                          ),
                          validator: (value) {
                            return valid.validateName(value!);
                          },
                        ),
                        SizedBox(height: 20),
                        BirthDatePicker(controller: birthDateController),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            label: Text("Enter Your Email"),
                          ),
                          validator: (value) {
                            valid.validationEmail(value!);
                            if (state.emails.keys.contains(value)) {
                              return 'This Email Used Before Try Another one';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text("Enter Your Password"),
                          ),
                          validator: (value) {
                            return valid.validatePassword(value!);
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: phonNumberController,
                          keyboardType: TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                            label: Text("Enter Your Phone Number"),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return null;
                            }
                            return valid.validatePhoneNumber(value);
                          },
                        ),
                        SizedBox(height: 20),

                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        20,
                                        19,
                                        114,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate() &&
                                          birthDateController.text.isNotEmpty) {
                                        DateTime dateOfBirth = DateTime.parse(
                                          birthDateController.text,
                                        );
                                        final UserModel user = UserModel(
                                          id:
                                              DateTime.now().microsecond
                                                  .toString(),
                                          firstName: firstNameController.text,
                                          lastName: lastNameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phonNumber: phonNumberController.text,
                                          dateOfBirth: dateOfBirth,
                                          profileImage: '',
                                          createdAt: DateTime.now(),
                                          lastLoginAt: DateTime.now(),
                                        );
                                        context.read<AuthCubit>().register(
                                          user,
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => LoginScrean(),
                                          ),
                                        );
                                      }
                                    },
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
