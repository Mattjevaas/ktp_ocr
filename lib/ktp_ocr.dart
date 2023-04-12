import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

class KtpOcr {
  /// Getting ktp data of type [KtpData] from ktp image
  /// ```dart
  /// final ktpData = KtpOcr.getKtpData(imagePath:"/path/to/image")
  /// print(ktpData.nik)
  /// ```
  static void getKtpData({required String imagePath}) async {
    String text = await FlutterTesseractOcr.extractText(
      imagePath,
      language: 'ind',
      args: {
        "psm": "4",
        "preserve_interword_spaces": "1",
      },
    );
  }
}
