import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class ByteConvert {
  /// Convert Uint8List to Accessible File Path
  static Future<String> createImagePath(Uint8List byte) async {
    final tempDir = await getTemporaryDirectory();
    File file = File('${tempDir.path}/temp.png');

    if (await file.exists()) {
      await file.delete();
    }

    await file.create();
    file.writeAsBytesSync(byte);

    return file.path;
  }
}
