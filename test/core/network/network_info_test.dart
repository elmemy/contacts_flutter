import 'package:chat_demo/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([Connectivity])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(mockConnectivity);
  });

  group('isConnected', () {
    test('should return true when the device is connected to the internet', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.mobile);

      // Act
      final result = await networkInfo.isConnected;

      // Assert
      expect(result, true);
      verify(mockConnectivity.checkConnectivity());
    });

    test('should return false when the device is not connected to the internet', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.none);

      // Act
      final result = await networkInfo.isConnected;

      // Assert
      expect(result, false);
      verify(mockConnectivity.checkConnectivity());
    });

    test('should return true when the device is connected to WiFi', () async {
      // Arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((_) async => ConnectivityResult.wifi);

      // Act
      final result = await networkInfo.isConnected;

      // Assert
      expect(result, true);
      verify(mockConnectivity.checkConnectivity());
    });
  });
}
