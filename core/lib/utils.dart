import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

String getNameFromEmail(String email) {
  return email.split('@')[0];
}

Future<List<File>> pickImages() async {
  List<File> images = [];
  final imagePicker = ImagePicker();
  final imagesFile = await imagePicker.pickMultiImage();
  if (imagesFile.isNotEmpty) {
    for (final image in imagesFile) {
      images.add(File(image.path));
    }
  }
  return images;
}

String getLinkFromString(String text) {
  String link = '';
  List<String> wordInSentence = text.split(' ');
  for (String word in wordInSentence) {
    if (word.startsWith('https://') || word.startsWith('www.')) {
      link = word;
    }
  }
  return link;
}

List<String> getHastagFromString(String text) {
  List<String> hashtags = [];
  List<String> wordInSentence = text.split(' ');
  for (String word in wordInSentence) {
    if (word.startsWith('#')) {
      hashtags.add(word);
    }
  }
  return hashtags;
}
