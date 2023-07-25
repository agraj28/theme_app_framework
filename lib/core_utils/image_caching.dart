import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:theme_architecture/core_utils/LRU_caching.dart';

class Image {
   Uint8List? imageData;
  // Other properties and methods specific to your Image class

  Image(this.imageData);
}

class ImageCache {
  final LRUCache<String, Image> _cache;

  ImageCache() : _cache = LRUCache<String, Image>();

  Future<ui.Image?> getImage(String url) async {
    final image = _cache.get(url);
    if (image?.imageData != null) {
      print('Image found in cache: $url');
      return _loadImageFromData(image?.imageData!);
    }

    print('Image not found in cache: $url');
    // Load the image from network or disk
    final loadedImage = await _loadImageFromNetworkOrDisk(url);

    if (loadedImage?.imageData != null) {
      _cache.put(url, loadedImage!);
      return _loadImageFromData(loadedImage.imageData!);
    }else{
      return null;
    }


  }

  Future<Image?> _loadImageFromNetworkOrDisk(String url) async{
    var imageData = await _getImageDataFromUrl(url);
    return Image(imageData);
  }

  Future<Uint8List?> _getImageDataFromUrl(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      print('Failed to fetch image: ${response.statusCode}');
      return null;
    }
  }

  Future<ui.Image?> _loadImageFromData(Uint8List? imageData) async {
    final completer = Completer<ui.Image>();
    if (imageData != null){
      final codec = await ui.instantiateImageCodec(imageData);
      final frame = await codec.getNextFrame();
      completer.complete(frame.image);
    }

    return completer.future;
  }
}
