import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';
import 'package:instagram_flutter/services/assets_manager.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/device_size.dart';
import 'package:instagram_flutter/widgets/customs/custom_buttons.dart';
import 'package:instagram_flutter/widgets/customs/custom_form_fields.dart';
import 'package:instagram_flutter/widgets/customs/custom_text.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//
// Form key
  late GlobalKey<FormState> _formkey;

// Controllers
  late TextEditingController _emailController, _passwordController;

// Password visibility
  final bool _isObscure = true;

  @override
  void initState() {
    _formkey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _formkey.currentState?.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    ();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Device.standardSpacing * 2),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SizedBox(
                  height: Device.appBarHeight + Device(context).statusBarHeight,
                ),
                SvgPicture.asset(
                  AssetsManager.icInstagram,
                  colorFilter:
                      const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                  height: 64,
                ),
                Image.asset(
                  AssetsManager.instaGif,
                ),
                EmailField(
                  emailController: _emailController,
                ),
                SizedBox(
                  height: Device.standardSpacing,
                ),
                PasswordField(
                  passwordController: _passwordController,
                  isObscure: _isObscure,
                ),
                SizedBox(
                  height: Device.standardSpacing * 3,
                ),
                MyGradientButton(
                  text: "Login",
                  onPressed: () {},
                  width: double.infinity,
                ),
                SizedBox(
                  height: Device.standardSpacing * 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    SizedBox(
                      width: Device.standardSpacing,
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, SignUpScreen.routeName),
                      child: const MySubtitleText(
                        text: "Sign up",
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
