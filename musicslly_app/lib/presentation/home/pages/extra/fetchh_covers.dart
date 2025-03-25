import 'package:firebase_storage/firebase_storage.dart';

Future<List<String>> fetchCoverImageUrls() async {
  List<String> imageUrls = [];
  try {
    // Create a reference to the covers folder
    Reference ref = FirebaseStorage.instance.ref().child('covers');

    // List all items (files) in the covers folder
    ListResult result = await ref.listAll();

    // Get the download URL for each file
    for (Reference item in result.items) {
      String url = await item.getDownloadURL();
      imageUrls.add(url);
    }
  } catch (e) {
    print('Failed to fetch image URLs: $e');
  }
  return imageUrls;
}