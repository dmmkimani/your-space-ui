import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/screens/room/room.dart';
import 'room_page_test.mocks.dart';

@GenerateMocks([Server])
void main() {
  late MockServer mockServer;
  late String building;
  late String room;
  late String date;

  setUp(() {
    mockServer = MockServer();
    building = 'the_great_hall';
    room = 'gh001';
    date = '28.3.2022';

    when(mockServer.getRoomDetails({'building': building, 'room': room}))
        .thenAnswer((_) async => mockRoomDetails());

    when(mockServer.getRoomBookings(
            {'building': building, 'room': room, 'date': date}))
        .thenAnswer((_) async => mockRoomBookings());
  });

  testWidgets('loadWidgetData test', (WidgetTester tester) async {
    await tester
        .pumpWidget(MaterialApp(home: Room(mockServer, building, room)));

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
