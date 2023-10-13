import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:instagram_flutter/screens/login_screen.dart';
import 'package:instagram_flutter/services/assets_manager.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/device_size.dart';
import 'package:instagram_flutter/widgets/customs/custom_buttons.dart';
import 'package:instagram_flutter/widgets/customs/custom_form_fields.dart';
import 'package:instagram_flutter/widgets/customs/custom_text.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signup";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final bool _isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Device.standardSpacing * 2),
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
              SizedBox(
                height: Device.standardSpacing,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage:
                        NetworkImage(AssetsManager.losAngelesWallArt),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: MyIconButton(
                      onPressed: () {},
                      iconData: IconlyBold.add_user,
                      iconColor: secondaryColor,
                      hasBgColor: true,
                      bgColor: darkScaffoldColor,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Device.standardSpacing * 2,
              ),
              EmailField(
                emailController: _emailController,
              ),
              SizedBox(
                height: Device.standardSpacing,
              ),
              PasswordField(
                passwordController: _passController,
                isObscure: _isObscure,
              ),
              SizedBox(
                height: Device.standardSpacing,
              ),
              ConfirmPasswordField(
                passwordController: _passController,
                repeatPasswordController: _confirmPassController,
                isObscure: _isObscure,
              ),
              SizedBox(
                height: Device.standardSpacing * 3,
              ),
              MyGradientButton(
                text: "Sign up",
                onPressed: () {},
                width: double.infinity,
              ),
              SizedBox(
                height: Device.standardSpacing * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  SizedBox(
                    width: Device.standardSpacing / 2,
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, LoginScreen.routeName),
                    child: const MySubtitleText(
                      text: "Login",
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
