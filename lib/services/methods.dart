import 'package:image_picker/image_picker.dart';

// *************** IMAGE PICKER ***************** //
dynamic pickImageLocaly({
  required ImageSource source,
}) async {
  final ImagePicker imagePicker = ImagePicker();

  XFile? pickedImage = await imagePicker.pickImage(source: source);

  if (pickedImage != null) {
    return await pickedImage.readAsBytes();
  }
  // ignore: avoid_print
  print("No image selected");
}
