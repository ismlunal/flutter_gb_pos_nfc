import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gb_pos_nfc/flutter_gb_pos_nfc.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_gb_pos_nfc');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    //expect(await FlutterGbPosNfc.platformVersion, '42');
  });
}
