import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ktp_ocr/ktp_ocr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('KTP OCR example app'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? image = await picker.pickImage(
                source: ImageSource.gallery,
              );

              KtpOcr.getKtpData(imagePath: image!.path);
            },
            child: const Text("Get KTP Image"),
          ),
        ),
      ),
    );
  }
}
