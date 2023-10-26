import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';
// Screens
import '/screens/login_screen.dart';
import '/screens/complete_user_info_screen.dart';
// Resources
import '/resources/auth_methods.dart';
// Services
import '/services/assets_manager.dart';
import '/services/loading_manager.dart';
import '/services/methods.dart';
import '/services/dialogs.dart';
// Utils
import '/utils/colors.dart';
import '/utils/device_size.dart';
// Widgets
import '/widgets/customs/custom_buttons.dart';
import '/widgets/customs/custom_form_fields.dart';
import '/widgets/customs/custom_text.dart';
//

class SignUpScreen extends StatefulWidget {
  static const routeName = "/signup";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
//
// ************** Variables ************** //
  late GlobalKey<FormState> _formkey;

  late TextEditingController _nameController,
      _emailController,
      _passwordController,
      _bioController,
      _confirmPassController;

  final bool _isObscure = true;

  bool _isLoading = false;

  Uint8List? _pickedImage;

// **** Initialize **** //
  @override
  void initState() {
    _formkey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPassController = TextEditingController();
    _bioController = TextEditingController();
    super.initState();
  }

// **** Dispose **** //
  @override
  void dispose() {
    _formkey.currentState?.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassController.dispose();
    _bioController.dispose();
    super.dispose();
  }

// ************** Methods ************** //

// Pick image from gallery or camera
  void selectImage() async {
    await Dialogs.imagePicker(
      context: context,
      cameraFCT: () async {
        _pickedImage = await pickImageLocaly(source: ImageSource.camera);
        setState(() {});
      },
      galleryFCT: () async {
        _pickedImage = await pickImageLocaly(source: ImageSource.gallery);
        setState(() {});
      },
      removeFCT: () {
        _pickedImage = null;
        setState(() {});
      },
    );
  }

// Submit form & register user
  Future<void> _submitForm() async {
    // Validate form
    final isValid = _formkey.currentState!.validate();
    if (!isValid) return;

    // Save form
    _formkey.currentState!.save();
    try {
      setState(() {
        _isLoading = true;
      });
      // Register Function
      await AuthMethods().registerWithEmailAndPassword(
        username: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        bio: _bioController.text.trim(),
        profilePhoto: _pickedImage!,
      );
      if (!mounted) return;
      Navigator.pushNamed(context, CompleteUserInfoScreen.routeName);
      // Show success message
      Dialogs.toastSuccess(
        msg: "User Registered Successfully",
        context: context,
      );
      // Error handling
    } on FirebaseAuthException catch (error) {
      await Dialogs.error(
        context: context,
        subtitle: error.message.toString(),
      );
    } catch (error) {
      await Dialogs.error(
        context: context,
        subtitle: error.toString(),
      );
    } finally {
      _isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: LoadingManager(
        isLoading: _isLoading,
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
                      height: Device.standardSpacing * 3,
                    ),
                    Shimmer.fromColors(
                      period: const Duration(seconds: 5),
                      baseColor: Theme.of(context).colorScheme.primary,
                      highlightColor: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        "Capture, Share, and Connect with the World",
                        style: TextStyle(
                            fontFamily: GoogleFonts.pacifico().fontFamily),
                      ),
                    ),
                    SizedBox(
                      height: Device.standardSpacing,
                    ),
                    // ***** Upload Profile ***** //
                    Stack(
                      children: [
                        // ***** Profile image ***** //
                        _pickedImage != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_pickedImage!),
                              )
                            : CircleAvatar(
                                radius: 64,
                                backgroundImage:
                                    NetworkImage(AssetsManager.defaultProfile),
                              ),

                        // ***** Add user icon ***** //
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: MyIconButton(
                            onPressed: selectImage,
                            iconData: IconlyBold.add_user,
                            iconColor: secondaryColor,
                            hasBgColor: true,
                            bgColor: darkScaffoldColor,
                          ),
                        )
                      ],
                    ),

                    // ***** TextFormFields ***** //
                    SizedBox(
                      height: Device.standardSpacing * 2,
                    ),
                    NameField(
                      label: "Username",
                      hintText: "Enter your username",
                      prefixIcon: IconlyLight.profile,
                      nameController: _nameController,
                    ),
                    SizedBox(
                      height: Device.standardSpacing,
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
                      height: Device.standardSpacing,
                    ),
                    ConfirmPasswordField(
                      passwordController: _passwordController,
                      repeatPasswordController: _confirmPassController,
                      isObscure: _isObscure,
                    ),
                    SizedBox(
                      height: Device.standardSpacing,
                    ),
                    MultilineField(
                      fieldController: _bioController,
                      label: "Bio",
                      hintText: "Tell others about yourself!",
                      prefixIcon: IconlyLight.info_square,
                    ),
                    SizedBox(
                      height: Device.standardSpacing * 3,
                    ),
                    // ***** Sign up button ***** //
                    MyGradientButton(
                      text: "Sign up",
                      onPressed: () async {
                        _submitForm();
                      },
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
                          onTap: () => Navigator.pushNamed(
                              context, LoginScreen.routeName),
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
          ),
        ),
      ),
    );
  }
}
