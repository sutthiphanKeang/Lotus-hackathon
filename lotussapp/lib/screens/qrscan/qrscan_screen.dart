import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


class QrScreen extends StatelessWidget {
  static String routeName = "/qrscan";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
        children: [
          Text(
            "Scan Your QR Code",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      ),
      body: MobileScanner(
          allowDuplicates: false,
          controller: MobileScannerController(
            facing: CameraFacing.front, torchEnabled: true),
          onDetect: (barcode, args) {
            if (barcode.rawValue == null) {
              debugPrint('Failed to scan Barcode');
            } else {
              final String code = barcode.rawValue!;
              debugPrint('Barcode found! $code');
            }
          }),
    );

  }
  }