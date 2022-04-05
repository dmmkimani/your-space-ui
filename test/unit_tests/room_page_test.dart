import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/functions/room_helpers.dart';
import 'package:project/tabs/home/screens/room/room.dart';
import 'package:project/tabs/provider.dart';
import 'room_page_test.mocks.dart';

@GenerateMocks([Server, UserData])
void main() {
  late MockServer mockServer;
  late MockUserData mockUserData;
  late String building;
  late String room;
  late String date;

  setUp(() {
    mockServer = MockServer();
    mockUserData = MockUserData();
    building = 'the_great_hall';
    room = 'gh001';
    date = RoomHelperFunctions().formatDate(DateTime.now());

    when(mockServer.getRoomDetails({'building': building, 'room': room}))
        .thenAnswer((_) async => mockRoomDetails());

    when(mockServer.getRoomBookings(
            {'building': building, 'room': room, 'date': date}))
        .thenAnswer((_) async => mockRoomBookings());
  });

  testWidgets('loadWidgetData test', (WidgetTester tester) async {
    await tester.pumpWidget(
        MaterialApp(home: Room(mockServer, mockUserData, building, room)));

    final RoomState state = tester.state(find.byType(Room));

    verify(mockServer.getRoomDetails({'building': building, 'room': room}));
    verify(mockServer.getRoomBookings(
        {'building': building, 'room': room, 'date': state.date}));

    expect(await state.loadWidgetData(), {
      'roomDetails': await mockRoomDetails(),
      'roomBookings': await mockRoomBookings()
    });
  });
}

Future<Map<String, dynamic>> mockRoomDetails() async {
  Map<String, dynamic> mock = {};
  return {'available': true, 'capacity': 128, 'amenities': mock};
}

Future<Map<String, dynamic>> mockRoomBookings() async {
  return {};
}
