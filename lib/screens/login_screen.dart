import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';
import '../const/const_vars.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            SvgPicture.asset(
              instagramLogo,
              colorFilter:
                  const ColorFilter.mode(primaryColor, BlendMode.srcIn),
              height: 64,
            ),
            const SizedBox(height: 64),
            TextFieldInput(
              controller: _emailController,
              label: "E-mail",
              hintText: "Enter your email",
              keyboardType: TextInputType.emailAddress,
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 24),
            TextFieldInput(
              controller: _passController,
              label: "Password",
              hintText: "Enter your password",
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: IconlyBold.password,
              isPass: true,
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: blueColor,
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text(
                "Login",
                style: TextStyle(color: mobileBackgroundColor),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
