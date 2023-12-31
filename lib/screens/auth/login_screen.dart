import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_flutter/screens/responsive/responsive_layout_screen.dart';
// Screens
import '/screens/auth/signup_screen.dart';
// Services
import '/services/assets_manager.dart';
import '/services/loading_manager.dart';
import '/services/dialogs.dart';
// Utils
import '/utils/colors.dart';
import '/utils/device_size.dart';
// Widgets
import '/widgets/auth/google_btn.dart';
import '/widgets/customs/custom_buttons.dart';
import '/widgets/customs/custom_form_fields.dart';
import '/widgets/customs/custom_text.dart';
// Resources
import '/resources/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//
// ************** Variables ************** //
  late GlobalKey<FormState> _formkey;

  late TextEditingController _emailController, _passwordController;

  final bool _isObscure = true;

  bool isLoading = false;

// **** Initialize **** //
  @override
  void initState() {
    _formkey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

// **** Dispose **** //
  @override
  void dispose() {
    _formkey.currentState?.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    ();
    super.dispose();
  }

// ************** Methods ************** //
// Submit form & register user
  Future<void> _submitForm() async {
    // Validate form
    final isValid = _formkey.currentState!.validate();
    if (!isValid) return;

    // Save form
    _formkey.currentState!.save();
    try {
      setState(() {
        isLoading = true;
      });
      // Register method
      await AuthMethods().loginWithEmailAndPass(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (!mounted) return;
      // Success Toast
      Dialogs.toastSuccess(
        msg: "Logged in Successfully",
        context: context,
      );
      Navigator.pushReplacementNamed(context, ResponsiveLayout.routeName);
      // Error handling
    } on FirebaseAuthException catch (error) {
      await Dialogs.error(
        context: context,
        subtitle: error.message.toString(),
      );
      setState(() {});
    } catch (error) {
      await Dialogs.error(
        context: context,
        subtitle: error.toString(),
      );
      setState(() {});
    } finally {
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingManager(
      isLoading: isLoading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Device.standardSpacing * 2),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: Device.appBarHeight,
                  ),
                  SvgPicture.asset(
                    AssetsManager.icInstagram,
                    colorFilter:
                        const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                    // height: 64,
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
                    onPressed: () async {
                      _submitForm();
                    },
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: Device.standardSpacing,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Divider(
                        indent: 8,
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'OR',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        endIndent: 8,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: Device.standardSpacing,
                  ),
                  const GoogleButton(),
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
                        onTap: () => Navigator.pushReplacementNamed(
                            context, SignUpScreen.routeName),
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
      ),
    );
  }
}
