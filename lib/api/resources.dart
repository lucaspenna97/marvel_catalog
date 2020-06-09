import 'dart:convert';

import 'package:crypto/crypto.dart';

class Resources {
  ///Copy and Paste your public/private key as following
  static String _publicKey = "7384d0de750f5d5f1db3fda4cb737fde";
  static String _privateKey = "1c2f22f000240df85a61e4edab4905855e089af7";

  static String _domain = "http://gateway.marvel.com";

  static String urlCharacters(int limit, int offset) {
    return "$_domain/v1/public/characters?ts=${getTimestamp()}&apikey=$_publicKey&hash=${generateHash()}&limit=$limit&offset=$offset";
  }

  static String urlComics(int characterId, int limit) {
    return "$_domain/v1/public/characters/$characterId/comics?ts=${getTimestamp()}&apikey=$_publicKey&hash=${generateHash()}&limit=$limit";
  }

  static String urlImages(String path, String imageVariant, String extension) {
    return path + imageVariant + "." + extension;
  }

  static int getTimestamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  ///Generate MD5 hash
  static generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return digest.toString();
  }

  static generateHash() {
    int timeStamp = getTimestamp();
    String hash = generateMd5(timeStamp.toString() + _privateKey + _publicKey);
    return hash;
  }
}
