import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

class MockAssetBundle extends Mock implements AssetBundle {
  String? mockData;
  bool throwOnLoadString = false;

  void setMockData(String key, String data) {
    mockData = data;
  }

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    if (throwOnLoadString) {
      throw Exception('Asset not found');
    }
    return mockData ?? '{}';
  }
}
