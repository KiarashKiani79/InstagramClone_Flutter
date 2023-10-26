import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../utils/validator.dart';

// ****************** Name ****************** //
class NameField extends StatelessWidget {
  final TextEditingController nameController;
  final String label;
  final String hintText;
  final IconData prefixIcon;

  const NameField({
    super.key,
    required this.nameController,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
      ),
      validator: (value) {
        return MyValidators.usernameValidator(value);
      },
    );
  }
}

// ****************** Email ****************** //
class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;
  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        label: Text("Email address"),
        hintText: "email@domain.com",
        prefixIcon: Icon(
          IconlyLight.message,
        ),
      ),
      validator: (value) {
        return MyValidators.emailValidator(value);
      },
    );
  }
}

// ****************** Password ****************** //
// ignore: must_be_immutable
class PasswordField extends StatefulWidget {
  PasswordField({
    super.key,
    required TextEditingController passwordController,
    required this.isObscure,
  }) : _passwordController = passwordController;
  final TextEditingController _passwordController;
  late bool isObscure;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._passwordController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: widget.isObscure,
      decoration: InputDecoration(
        label: const Text("Password"),
        hintText: "Enter a strong password",
        prefixIcon: const Icon(
          IconlyLight.lock,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              widget.isObscure = !widget.isObscure;
            });
          },
          icon: Icon(
            widget.isObscure ? IconlyLight.show : IconlyLight.hide,
          ),
        ),
      ),
      validator: (value) {
        return MyValidators.passwordValidator(value);
      },
    );
  }
}

// ****************** Confirm Password ****************** //
// ignore: must_be_immutable
class ConfirmPasswordField extends StatefulWidget {
  ConfirmPasswordField({
    super.key,
    required TextEditingController repeatPasswordController,
    required this.isObscure,
    required TextEditingController passwordController,
  })  : _repeatPasswordController = repeatPasswordController,
        _passwordController = passwordController;
  final TextEditingController _repeatPasswordController;
  late bool isObscure;
  final TextEditingController _passwordController;

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._repeatPasswordController,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      obscureText: widget.isObscure,
      decoration: InputDecoration(
        label: const Text("Confirm Password"),
        hintText: "Confirm your password",
        prefixIcon: const Icon(
          IconlyLight.lock,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              widget.isObscure = !widget.isObscure;
            });
          },
          icon: Icon(
            widget.isObscure ? IconlyLight.show : IconlyLight.hide,
          ),
        ),
      ),
      validator: (value) {
        return MyValidators.repeatPasswordValidator(
          value: value,
          password: widget._passwordController.text,
        );
      },
    );
  }
}

// ****************** Multiline ****************** //
class MultilineField extends StatelessWidget {
  final TextEditingController fieldController;
  final String label;
  final String hintText;
  final IconData prefixIcon;

  const MultilineField({
    super.key,
    required this.fieldController,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      textInputAction: TextInputAction.newline,
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      decoration: InputDecoration(
        label: Text(label),
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 45.0),
          child: Icon(
            prefixIcon,
          ),
        ),
        // Description => IconlyLight.paper
        // Bio => IconlyLight.info_square
      ),
      validator: (value) {
        return MyValidators.descriptionValidator(value, label);
      },
    );
  }
}
