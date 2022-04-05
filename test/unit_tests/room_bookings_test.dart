import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/screens/room/widgets/listview_bookings_room.dart';
import 'package:project/tabs/provider.dart';

import 'room_bookings_test.mocks.dart';

@GenerateMocks([Server, UserData])
void main() {
  late MockServer mockServer;
  late MockUserData mockUserData;
  late String building;
  late String room;
  late DateTime today;
  late DateTime tomorrow;

  setUp(() {
    mockServer = MockServer();
    mockUserData = MockUserData();
    building = 'the_great_hall';
    room = 'gh001';
    today = DateTime.now();
    tomorrow = today.add(const Duration(days: 1));
  });

  group('room bookings functions test', () {
    testWidgets('isAfterNow test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: RoomBookings(mockServer, mockUserData, mockReload, building,
              room, today, mockBookings())));

      final RoomBookingsState state = tester.state(find.byType(RoomBookings));

      // Test the same day, but a later time
      expect(state.isAfterNow('23:00'), true);

      // Test the same day, but an earlier time
      expect(state.isAfterNow('00:00'), false);

      await tester.pumpWidget(MaterialApp(
          home: RoomBookings(mockServer, mockUserData, mockReload, building,
              room, tomorrow, mockBookings())));

      // Test tomorrow
      expect(state.isAfterNow('00:00'), true);
    });

    testWidgets('isAvailable test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: RoomBookings(mockServer, mockUserData, mockReload, building,
              room, today, mockBookings())));

      final RoomBookingsState state = tester.state(find.byType(RoomBookings));

      // Time slot is available
      expect(state.isAvailable('10:00'), true);

      // Time slot is available
      expect(state.isAvailable('11:00'), true);

      // Time slot is not available
      expect(state.isAvailable('12:00'), false);
    });

    testWidgets('isBooked test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: RoomBookings(mockServer, mockUserData, mockReload, building,
              room, today, mockBookings())));

      final RoomBookingsState state = tester.state(find.byType(RoomBookings));

      // Time slot is not booked
      expect(state.isBooked('10:00'), false);

      // Time slot is booked
      expect(state.isBooked('11:00'), true);
    });

    testWidgets('isLastTimeSlot test', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: RoomBookings(mockServer, mockUserData, mockReload, building,
              room, today, mockBookings())));

      final RoomBookingsState state = tester.state(find.byType(RoomBookings));

      // It is the last time slot
      expect(state.isLastTimeSlot(['10:00', '11:00', '12:00'], 2), true);

      // It is not the last time slot
      expect(state.isLastTimeSlot(['10:00', '11:00', '12:00'], 1), false);
    });
  });
}

void mockReload() {}

Map<String, dynamic> mockBookings() {
  return {
    '10:00': {'available': true, 'booked': false},
    '11:00': {'available': true, 'booked': true},
    '12:00': {'available': false, 'booked': false}
  };
}
