import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/screens/room/widgets/dialog_book.dart';
import 'book_dialog_test.mocks.dart';

@GenerateMocks([Server])
void main() {
  late MockServer mockServer;
  late String userEmail;
  late String building;
  late String room;
  late DateTime date;
  late List<String> timeSlots;
  late String selectedTimeSlot;

  setUp(() {
    mockServer = MockServer();
    userEmail = 'test@app.com';
    building = 'the_great_hall';
    room = 'gh001';
    date = DateTime.now();
    timeSlots = ['10:00', '11:00', '12:00'];
    selectedTimeSlot = '11:00';

    when(mockServer.book({
      'userEmail': userEmail,
      'date': '5.4.2022',
      'building': building,
      'room': room,
      'people': '',
      'description': '',
      'startTime': selectedTimeSlot,
      'duration': 0
    })).thenAnswer((_) async => mockRoomBookings());
  });

  testWidgets('book dialog functions tests', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: BookDialog(mockServer, mockReload, building, room, date,
            timeSlots, selectedTimeSlot)));

    final BookDialogState state = tester.state(find.byType(BookDialog));

    expect(state.startTime, '11:00');
    expect(state.duration, 0);
    expect(state.numPeople, '');
    expect(state.description, '');

    state.book(state.context);

    verify(mockServer.book({
      'userEmail': userEmail,
      'date': '5.4.2022',
      'building': building,
      'room': room,
      'people': '',
      'description': '',
      'startTime': selectedTimeSlot,
      'duration': 0
    }));
  });
}

void mockReload() {}

Future<Map<String, dynamic>> mockRoomBookings() async {
  return {'success': true};
}
