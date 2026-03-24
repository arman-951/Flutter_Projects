import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_gradient_button.dart';
import '../widgets/auth_text_field.dart';
import 'signup_screen.dart';
import '../../../core/theme/app_palette.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void loginUser() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => isLoading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Login Successful")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 28,
                    color: AppPallete.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                AuthTextField(
                  hintText: "Email",
                  controller: emailController,
                ),
                const SizedBox(height: 15),

                AuthTextField(
                  hintText: "Password",
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),

                isLoading
                    ? const CircularProgressIndicator()
                    : AuthGradientButton(
                        text: "Login",
                        onTap: loginUser,
                      ),

                const SizedBox(height: 20),

                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: AppPallete.greyColor),
                    children: [
                      const TextSpan(text: "Don't have an account? "),

                      TextSpan(
                        text: "Sign Up",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                        ..onTap=() {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (_)=> const SignupScreen(),
                              ),
                          );
                        },
                        mouseCursor: SystemMouseCursors.click,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}