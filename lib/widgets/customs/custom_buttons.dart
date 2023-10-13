import 'package:flutter/material.dart';
import 'package:instagram_flutter/widgets/customs/custom_text.dart';

import '../../utils/colors.dart';
import '../../utils/device_size.dart';

// ********************** ElevatedButton ********************** //
class MyElevatedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double? width;
  final Color? seedColor;
  final bool hasIcon;
  final IconData? iconData;

  const MyElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.seedColor,
    this.hasIcon = false,
    this.iconData,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    Color? foregroundColor;
    Color? backgroundColor;

    switch (seedColor) {
      case primaryColor:
        foregroundColor = Theme.of(context).colorScheme.onPrimary;
        backgroundColor = Theme.of(context).colorScheme.primary;
        break;
      case secondaryColor:
        foregroundColor = Theme.of(context).colorScheme.onSecondary;
        backgroundColor = Theme.of(context).colorScheme.secondary;
        break;
      case tertiaryColor:
        foregroundColor = Theme.of(context).colorScheme.onTertiary;
        backgroundColor = Theme.of(context).colorScheme.tertiary;
        break;
      case errorColor:
        foregroundColor = Theme.of(context).colorScheme.onError;
        backgroundColor = Theme.of(context).colorScheme.error;
        break;
      default:
        backgroundColor = seedColor;
        foregroundColor =
            seedColor != null ? Theme.of(context).colorScheme.surface : null;
    }
    return hasIcon
        // With Icon
        ? ElevatedButton.icon(
            onPressed: () {
              onPressed();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
              minimumSize: Size(
                width ?? double.minPositive,
                Device.buttonHeight,
              ),
            ),
            label: Text(text),
            icon: Icon(iconData),
          )
        // Without Icon
        : ElevatedButton(
            onPressed: () {
              onPressed();
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
              minimumSize: Size(
                width ?? double.minPositive,
                Device.buttonHeight,
              ),
            ),
            child: Text(text),
          );
  }
}

// ********************** OutlinedButton ********************** //
class MyOutlinedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double? width;
  final bool hasBgColor;
  final Color? seedColor;
  final bool hasIcon;
  final IconData? iconData;

  const MyOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.seedColor,
    this.hasIcon = false,
    this.iconData,
    this.hasBgColor = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    Color? foregroundColor;

    switch (seedColor) {
      case primaryColor:
        foregroundColor = Theme.of(context).colorScheme.primary;

        break;
      case secondaryColor:
        foregroundColor = Theme.of(context).colorScheme.secondary;

        break;
      case tertiaryColor:
        foregroundColor = Theme.of(context).colorScheme.tertiary;

        break;
      case errorColor:
        foregroundColor = Theme.of(context).colorScheme.error;

        break;
      default:
        foregroundColor = seedColor;
    }
    return hasIcon
        // With Icon
        ? OutlinedButton.icon(
            onPressed: () {
              onPressed();
            },
            style: OutlinedButton.styleFrom(
              // Text Color
              foregroundColor:
                  foregroundColor ?? Theme.of(context).colorScheme.onSurface,
              backgroundColor: hasBgColor
                  ? foregroundColor?.withOpacity(0.1)
                  : Colors.transparent,
              minimumSize: Size(
                width ?? double.minPositive,
                Device.buttonHeight,
              ),
              // Border Color
              side: BorderSide(
                color:
                    foregroundColor ?? Theme.of(context).colorScheme.onSurface,
              ),
            ),
            label: Text(text),
            icon: Icon(iconData),
          )
        // Without Icon
        : OutlinedButton(
            onPressed: () {
              onPressed();
            },
            style: OutlinedButton.styleFrom(
              // Text Color
              foregroundColor:
                  foregroundColor ?? Theme.of(context).colorScheme.onSurface,
              backgroundColor: hasBgColor
                  ? foregroundColor?.withOpacity(0.2)
                  : Colors.transparent,
              minimumSize: Size(
                width ?? double.minPositive,
                Device.buttonHeight,
              ),
              // Border Color
              side: BorderSide(
                color:
                    foregroundColor ?? Theme.of(context).colorScheme.onSurface,
              ),
            ),
            child: Text(text),
          );
  }
}

// ********************** TextButton ********************** //
class MyTextButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color? seedColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final bool hasIcon;
  final IconData? iconData;

  const MyTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.seedColor,
    this.hasIcon = false,
    this.iconData,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    Color? foregroundColor;

    switch (seedColor) {
      case primaryColor:
        foregroundColor = Theme.of(context).colorScheme.primary;

        break;
      case secondaryColor:
        foregroundColor = Theme.of(context).colorScheme.secondary;

        break;
      case tertiaryColor:
        foregroundColor = Theme.of(context).colorScheme.tertiary;

        break;
      case errorColor:
        foregroundColor = Theme.of(context).colorScheme.error;

        break;
      default:
        foregroundColor = seedColor;
    }
    return hasIcon
        // With Icon
        ? TextButton.icon(
            onPressed: () {
              onPressed();
            },
            style: TextButton.styleFrom(
              // Text Color
              foregroundColor:
                  foregroundColor ?? Theme.of(context).colorScheme.onSurface,
            ),
            label: Text(
              text,
              style: TextStyle(
                fontSize: fontSize ?? Device.mediumTextSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
              ),
            ),
            icon: Icon(
              iconData,
              color: foregroundColor,
            ),
          )
        // Without Icon
        : TextButton(
            onPressed: () {
              onPressed();
            },
            style: TextButton.styleFrom(
              // Text Color
              foregroundColor:
                  foregroundColor ?? Theme.of(context).colorScheme.onSurface,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize ?? Device.mediumTextSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
              ),
            ),
          );
  }
}

// ********************** IconButton ********************** //
class MyIconButton extends StatelessWidget {
  final Function onPressed;
  final Color? iconColor;
  final IconData? iconData;
  final bool hasBgColor;
  final Color? bgColor;

  const MyIconButton({
    super.key,
    required this.onPressed,
    this.iconColor,
    required this.iconData,
    this.bgColor,
    this.hasBgColor = false,
  });

  @override
  Widget build(BuildContext context) {
    Color? foregroundColor;

    switch (iconColor) {
      case primaryColor:
        foregroundColor = Theme.of(context).colorScheme.primary;
        break;
      case secondaryColor:
        foregroundColor = Theme.of(context).colorScheme.secondary;
        break;
      case tertiaryColor:
        foregroundColor = Theme.of(context).colorScheme.tertiary;
        break;
      case errorColor:
        foregroundColor = Theme.of(context).colorScheme.error;
        break;
      default:
        foregroundColor = iconColor;
    }

    return hasBgColor
        // With BG Color
        ? IconButton(
            onPressed: () {
              onPressed();
            },
            style: IconButton.styleFrom(
              // Text Color
              foregroundColor: foregroundColor,
              backgroundColor: bgColor ?? foregroundColor!.withOpacity(0.2),
            ),
            icon: Icon(iconData),
          )
        // Without BG Color
        : IconButton(
            onPressed: () {
              onPressed();
            },
            style: IconButton.styleFrom(
              // Text Color
              foregroundColor: foregroundColor,
            ),
            icon: Icon(iconData),
          );
  }
}

// ********************** GradientElevatedButton ********************** //
class MyGradientButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double? width;
  final bool hasIcon;
  final IconData? iconData;

  const MyGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.hasIcon = false,
    this.iconData,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Device.buttonHeight,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            secondaryColor,
            tertiaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: hasIcon
          ? ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: Theme.of(context).colorScheme.surface,
                backgroundColor: Colors.transparent,
                disabledForegroundColor: Colors.transparent,
                disabledBackgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                minimumSize: Size(
                  width ?? double.minPositive,
                  Device.buttonHeight,
                ),
              ),
              onPressed: () {
                onPressed();
              },
              icon: Icon(
                iconData,
                color: Theme.of(context).colorScheme.surface,
              ),
              label: Padding(
                padding: EdgeInsets.all(Device.standardSpacing / 2),
                child: Text(
                  text,
                  style: TextStyle(fontSize: Device.largeTextSize),
                ),
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: Theme.of(context).colorScheme.surface,
                backgroundColor: Colors.transparent,
                disabledForegroundColor: Colors.transparent,
                disabledBackgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                minimumSize: Size(
                  width ?? double.minPositive,
                  Device.buttonHeight,
                ),
              ),
              onPressed: () {
                onPressed();
              },
              child: Padding(
                padding: EdgeInsets.all(Device.standardSpacing / 2),
                child: MyTitleText(text: text),
              ),
            ),
    );
  }
}
