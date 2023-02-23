import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class GalleryImageProvider with ChangeNotifier {
  Uint8List? _profile;
  get profile => _profile;

  uploadImage() async {
    final XFile? imagePro = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (imagePro != null) {
      _profile = await imagePro.readAsBytes();
    } else {
      _profile = null;
      Fluttertoast.showToast(msg: 'Image is not selected');
    }
    notifyListeners();
  }
}
