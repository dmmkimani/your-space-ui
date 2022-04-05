import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/screens/building/building.dart';
import 'package:project/tabs/provider.dart';
import 'building_page_test.mocks.dart';

@GenerateMocks([Server, UserData])
void main() {
  late MockServer mockServer;
  late MockUserData mockUserData;
  var buildings = [
    'the_great_hall',
    'school_of_management',
    'the_college',
    'y_twyni',
    'fulton_house',
    'faraday',
    'james_callaghan',
    'keir_hardie'
  ];

  setUp(() {
    mockServer = MockServer();
    mockUserData = MockUserData();
    when(mockServer.getBuildingDetails(argThat(isIn(buildings))))
        .thenAnswer((_) async => responseOk());
    when(mockServer.getBuildingDetails(argThat(isNot(isIn(buildings)))))
        .thenAnswer((_) async => throw ArgumentError());
  });

  group('building page tests', () {
    testWidgets('valid buildings test', (WidgetTester tester) async {
      for (var building in buildings) {
        await tester.pumpWidget(
            MaterialApp(home: Building(mockServer, mockUserData, building)));
        verify(mockServer.getBuildingDetails(building));
        Map<String, dynamic> response =
            await mockServer.getBuildingDetails(building);
        expect(response['response'], 200);
      }
    });
    testWidgets('invalid building test 1', (WidgetTester tester) async {
      await tester.pumpWidget(
          MaterialApp(home: Building(mockServer, mockUserData, '')));
      verify(mockServer.getBuildingDetails(''));
      expect(mockServer.getBuildingDetails(''), throwsArgumentError);
    });
    testWidgets('invalid building test 2', (WidgetTester tester) async {
      await tester.pumpWidget(
          MaterialApp(home: Building(mockServer, mockUserData, 'invalid')));
      verify(mockServer.getBuildingDetails('invalid'));
      expect(mockServer.getBuildingDetails('invalid'), throwsArgumentError);
    });
  });
}

Future<Map<String, dynamic>> responseOk() async {
  Map<String, dynamic> mock = {};
  return {
    'response': 200,
    'name': 'mock',
    'description': 'mock',
    'rooms': mock
  };
}
