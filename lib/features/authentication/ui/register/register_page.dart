import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tarwej/features/authentication/domain/Entity/register/register_model.dart';
import 'package:test_tarwej/features/authentication/ui/after_register/after_register_page.dart';
import 'package:test_tarwej/features/authentication/ui/register/register_bloc.dart';
import 'package:test_tarwej/features/authentication/ui/register/register_event.dart';
import 'package:test_tarwej/utils/app_button.dart';
import 'package:test_tarwej/utils/app_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: _Register()),
    );
  }
}

class _Register extends StatelessWidget {
  const _Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  AfterRegisterPage(phoneNumber: state.phoneNumber),
            ),
          );
        } else if (state is RegisterLoading) {
          buildLoadingProgressWidget();
        } else if (state is RegisterFailure) {
          print(state.errorMessage);
        }
      },
      child: Container(
        color: Colors.white12,
        //padding: EdgeInsets.symmetric(horizontal: 8,vertical: 32),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Spacer(),
                Container(height: 32),
                const Icon(
                  Icons.local_grocery_store_outlined,
                  size: 100,
                  color: Colors.green,
                ),
                Container(height: 24),
                const Text(
                  'Tarwej',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Container(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.facebook_outlined,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.apple_outlined,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: CupertinoColors.inactiveGray.withOpacity(0.3),
                      ),
                    ),
                    Container(width: 4),
                    const Text(
                      'or',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    Container(width: 4),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: CupertinoColors.inactiveGray.withOpacity(0.3),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const RegisterForm(),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(
                          text: 'By creating an account, you agree to the ',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'privacyPolicy ',
                            style: TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      const TextSpan(
                        text: 'and ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      WidgetSpan(
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'terms of use ',
                            style: TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'do you have an account?',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                AppButton(
                  title: 'Login',
                  function: () {},
                  height: 50,
                  fontWeight: FontWeight.bold,
                  width: MediaQuery.of(context).size.width * 0.4,
                  borderRadius: 8,
                  fontSize: 16,
                  buttonColor: Colors.deepPurple,
                  textColor: Colors.white,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool showPassword = false;

  void registerButtonPressed() {
    final validate = _formKey.currentState?.validate() ?? false;

    if (validate) {
      final input = RegisterModel(
          _usernameController.text,
          _emailController.text.isEmpty ? null : _emailController.text,
          _phoneController.text,
          _passwordController.text);
      BlocProvider.of<RegisterBloc>(context).add(RegisterSubmit(input));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'User name',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Container(
            height: 8,
          ),
          AppTextFormField.textForm(
            _usernameController,
            TextInputType.name,
            validate: (value) {
              if (value?.isEmpty ?? false) {
                return 'Please enter Name';
              }
              return null;
            },
          ),
          Container(
            height: 16,
          ),
          const Text(
            'Email (optional)',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Container(
            height: 8,
          ),
          AppTextFormField.textForm(_emailController, TextInputType.name),
          Container(
            height: 16,
          ),
          const Text(
            'Phone',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Container(
            height: 8,
          ),
          AppTextFormField.textForm(
            _phoneController,
            TextInputType.phone,
            // validate: (String value) {
            //   if (value.isEmpty) {
            //     return 'Please enter Name';
            //   }
            //   return null;
            // },
          ),
          Container(
            height: 16,
          ),
          const Text(
            'Password',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Container(
            height: 8,
          ),
          AppTextFormField.textForm(
            _passwordController,
            TextInputType.name,
            // validate: (String value) {
            //   if (value.isEmpty) {
            //     return 'Please enter Name';
            //   }
            //   return null;
            // },
            suffix: IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: showPassword
                  ? const Icon(Icons.remove_red_eye)
                  : const Icon(Icons.panorama_fish_eye_outlined),
            ),
            isPassword: showPassword ? false : true,
          ),
          Container(
            height: 16,
          ),
          BlocBuilder<RegisterBloc, RegisterState>(
            builder: (context, state) {
              return AppButton(
                title: 'Register',
                function: () {
                  registerButtonPressed();
                },
                height: 50,
                fontWeight: FontWeight.bold,
                width: double.infinity,
                borderRadius: 8,
                fontSize: 16,
                buttonColor: Colors.green,
                textColor: Colors.white,
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget buildLoadingProgressWidget() {
  return const Center(
    child: CircularProgressIndicator(
      color: Colors.orange,
    ),
  );
}
