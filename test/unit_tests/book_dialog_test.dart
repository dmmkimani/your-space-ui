import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/functions/room_helpers.dart';
import 'package:project/tabs/home/screens/room/widgets/dialog_book.dart';
import 'package:project/tabs/provider.dart';
import 'book_dialog_test.mocks.dart';

@GenerateMocks([Server, User, UserData])
void main() {
  late MockServer mockServer;
  late MockUser mockUser;
  late MockUserData mockUserData;
  late String userEmail;
  late String building;
  late String room;
  late DateTime date;
  late String formattedDate;
  late List<String> timeSlots;
  late String selectedTimeSlot;

  setUp(() {
    mockServer = MockServer();
    mockUser = MockUser();
    mockUserData = MockUserData();
    userEmail = 'test@app.com';
    building = 'the_great_hall';
    room = 'gh001';
    date = DateTime.now();
    formattedDate = RoomHelperFunctions().formatDate(date);
    timeSlots = ['10:00', '11:00', '12:00'];
    selectedTimeSlot = '11:00';

    when(mockServer.book({
      'userEmail': userEmail,
      'date': formattedDate,
      'building': building,
      'room': room,
      'people': '',
      'description': '',
      'startTime': selectedTimeSlot,
      'duration': 0
    })).thenAnswer((_) async => mockSuccessfulBook());
    when(mockUserData.user).thenReturn(mockUser);
    when(mockUser.email).thenReturn(userEmail);
  });

  testWidgets('book dialog functions tests', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: BookDialog(mockServer, mockUserData, mockReload, building, room,
            date, timeSlots, selectedTimeSlot)));

    final BookDialogState state = tester.state(find.byType(BookDialog));

    expect(state.startTime, '11:00');
    expect(state.duration, 0);
    expect(state.numPeople, '');
    expect(state.description, '');

    state.book(state.context);

    verify(mockServer.book({
      'userEmail': userEmail,
      'date': formattedDate,
      'building': building,
      'room': room,
      'people': '',
      'description': '',
      'startTime': selectedTimeSlot,
      'duration': 0
    }));
  });
}

void mockReload(String message) {}

Future<Map<String, dynamic>> mockSuccessfulBook() async {
  return {'success': true, 'message': 'mock'};
}

Future<Map<String, dynamic>> mockFailedBook() async {
  return {'success': false, 'message': 'mock'};
}
