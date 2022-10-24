import 'dart:async';

import 'package:flutter/services.dart';

class GBPosNfc {
  static const MethodChannel _channel = MethodChannel('flutter_gb_pos_nfc');
  static bool process = true;

  static Stream<PosNfcData> readCard() async* {
    while (process) {
      await Future.delayed(const Duration(seconds: 1));

      final String? cardID = await _channel.invokeMethod('getCardID');
      if (cardID != null) {
        PosNfcData cardData = PosNfcData(id: cardID, content: null);

        process = false;
        yield cardData;
      }
    }
  }

  static start() {
    process = true;
  }
}

class PosNfcData {
  final String? id;
  final String? content;

  PosNfcData({this.id, this.content});
}
