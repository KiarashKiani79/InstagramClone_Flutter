import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../utils/validator.dart';

// ****************** Fullname ****************** //
class FullnameField extends StatelessWidget {
  const FullnameField({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        label: Text("Full Name"),
        hintText: "Enter your full name",
        prefixIcon: Icon(
          IconlyLight.profile,
        ),
      ),
      validator: (value) {
        return MyValidators.displayNamevalidator(value);
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

// ****************** Description ****************** //
class DescriptionField extends StatelessWidget {
  const DescriptionField({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      maxLines: 5,
      decoration: const InputDecoration(
        label: Text("Description"),
        hintText: "Write a description",
        prefixIcon: Padding(
          padding: EdgeInsets.only(bottom: 95),
          child: Icon(
            IconlyLight.paper,
          ),
        ),
      ),
      validator: (value) {
        return MyValidators.descriptionValidator(value);
      },
    );
  }
}
