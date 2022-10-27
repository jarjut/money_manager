import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

extension SetRouteLocation on WidgetTester {
  Future<void> setRouteLocation(String location) async {
    final testRouteInformation = <String, dynamic>{
      'location': location,
    };
    final message = const JSONMethodCodec().encodeMethodCall(
      MethodCall('pushRouteInformation', testRouteInformation),
    );
    await ServicesBinding.instance.defaultBinaryMessenger
        .handlePlatformMessage('flutter/navigation', message, (_) {});

    await pumpAndSettle();
  }
}
