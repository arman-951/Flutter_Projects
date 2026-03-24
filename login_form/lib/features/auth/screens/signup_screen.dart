import 'package:flutter/material.dart';
import 'package:login_form/features/auth/screens/login_screen.dart';
import '../widgets/auth_gradient_button.dart';
import '../widgets/auth_text_field.dart';
import '../../../core/theme/app_palette.dart';
import 'package:flutter/gestures.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void signupUser() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => isLoading = false);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Signup Successful")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppPallete.whiteColor),
      ),
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
                  "Create Account",
                  style: TextStyle(
                    fontSize: 28,
                    color: AppPallete.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                AuthTextField(hintText: "Name", controller: nameController),
                const SizedBox(height: 15),

                AuthTextField(hintText: "Email", controller: emailController),
                const SizedBox(height: 15),

                AuthTextField(
                  hintText: "Password",
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 20),

                isLoading
                    ? const CircularProgressIndicator()
                    : AuthGradientButton(text: "Sign Up", onTap: signupUser),

                const SizedBox(height: 20),

                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: AppPallete.greyColor),
                    children: [
                      const TextSpan(text: "Already have an account? "),

                      TextSpan(
                        text: "Login",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            );
                          },
                        mouseCursor: SystemMouseCursors.click, // 👈 ONLY HERE
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
