import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:iconly/iconly.dart";
import "package:instagram_flutter/services/assets_manager.dart";
import "package:instagram_flutter/utils/colors.dart";
import "package:instagram_flutter/utils/device_size.dart";
import "package:instagram_flutter/widgets/customs/custom_buttons.dart";
import "package:instagram_flutter/widgets/customs/custom_text.dart";
import "package:flutter_styled_toast/flutter_styled_toast.dart";

class Dialogs {
// *************** ERROR  ***************** //
  static Future<void> error({
    required BuildContext context,
    required String subtitle,
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // image
            SvgPicture.asset(
              AssetsManager.errorIcon,
              height: 64.0,
              width: 64.0,
            ),
            SizedBox(
              height: Device.standardSpacing,
            ),
            // subtitle
            MySubtitleText(
              text: subtitle,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
        actions: [
          MyTextButton(
            text: "OK",
            seedColor: primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

// *************** WARNING  ***************** //
  static Future<void> warning({
    required BuildContext context,
    required String subtitle,
    required String buttonText,
    required Function fct,
  }) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // image
            SvgPicture.asset(
              AssetsManager.alertIcon,
              height: 64.0,
              width: 64.0,
            ),
            SizedBox(
              height: Device.standardSpacing,
            ),
            // subtitle
            MySubtitleText(
              text: subtitle,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
        actions: [
          MyTextButton(
            text: "Cancel",
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          MyTextButton(
            text: buttonText,
            seedColor: errorColor,
            onPressed: () {
              fct();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

// *************** Toast Success  ***************** //
  static ToastFuture toastSuccess({
    required String msg,
    required BuildContext context,
  }) {
    return showToast(
      msg,
      context: context,
      backgroundColor: Colors.green,
      borderRadius: BorderRadius.circular(Device.borderRadius),
      textStyle: TextStyle(
        color: Theme.of(context).colorScheme.surface,
        fontWeight: FontWeight.bold,
      ),
    );
  }

// *************** Image Picker  ***************** //
  static Future<void> imagePicker({
    required BuildContext context,
    required Function cameraFCT,
    required Function galleryFCT,
    required Function removeFCT,
  }) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: MyTitleText(text: "Choose an option"),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                MyTextButton(
                  text: "Camera",
                  hasIcon: true,
                  iconData: IconlyBold.camera,
                  onPressed: () {
                    cameraFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
                MyTextButton(
                  text: "Gallery",
                  hasIcon: true,
                  iconData: IconlyBold.image,
                  onPressed: () {
                    galleryFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
                MyTextButton(
                  text: "Remove",
                  hasIcon: true,
                  iconData: Icons.remove_circle_outline,
                  seedColor: errorColor,
                  onPressed: () {
                    removeFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
