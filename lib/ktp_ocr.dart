import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:ktp_ocr/helper/convert.dart';
import 'package:opencv_4/factory/pathfrom.dart';
import 'package:opencv_4/opencv_4.dart';

class KtpOcr {
  /// Getting ktp data of type [KtpData] from ktp image
  /// ```dart
  /// final ktpData = KtpOcr.getKtpData(imagePath:"/path/to/image")
  /// print(ktpData.nik)
  /// ```
  static void getKtpData({required String imagePath}) async {
    /// --- Proccessing the image ---
    /// Convert image to Grayscale
    final grayImage = await Cv2.cvtColor(
      pathString: imagePath,
      pathFrom: CVPathFrom.GALLERY_CAMERA,
      outputType: Cv2.COLOR_BGR2GRAY,
    );
    final grayImagePath = await ByteConvert.createImagePath(grayImage!);

    /// Transfrom image threshold
    final thresholdImage = await Cv2.threshold(
      pathString: grayImagePath,
      pathFrom: CVPathFrom.GALLERY_CAMERA,
      thresholdValue: 127,
      maxThresholdValue: 255,
      thresholdType: Cv2.THRESH_TRUNC,
    );
    final thresholdImagePath =
        await ByteConvert.createImagePath(thresholdImage!);

    /// ---------------------

    final String rawText = await FlutterTesseractOcr.extractText(
      thresholdImagePath,
      language: 'ind',
      args: {
        "psm": "4",
        "preserve_interword_spaces": "1",
      },
    );

    final cleanText = _cleanRawText(rawText);
    final List<String> splitedText = _splitText(cleanText);

    print(splitedText);
  }

  static String _cleanRawText(String rawText) {
    final newString = rawText.replaceAll("—", "").replaceAll("/", "");
    return newString;
  }

  static List<String> _splitText(String cleanText) {
    final newStringArr = cleanText.split("\n");
    return newStringArr;
  }
}
