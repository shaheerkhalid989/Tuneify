import 'package:flutter/material.dart';
import 'package:musicslly_app/presentation/home/pages/extra/fetchh_covers.dart';

class CoverImages extends StatefulWidget {
  @override
  _CoverImagesState createState() => _CoverImagesState();
}

class _CoverImagesState extends State<CoverImages> {
  Future<List<String>>? _imageUrls;

  @override
  void initState() {
    super.initState();
    _imageUrls = fetchCoverImageUrls();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: _imageUrls,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No images found'));
        } else {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Image.network(snapshot.data![index]);
            },
          );
        }
      },
    );
  }
}