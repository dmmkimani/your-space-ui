import 'package:flutter_test/flutter_test.dart';
import 'package:project/tabs/home/functions/room_helpers.dart';

void main() {
  late RoomHelperFunctions roomHelpers;

  setUp(() {
    roomHelpers = RoomHelperFunctions();
  });

  group('format methods test', () {
    test('formatDate test', () async {
      // For this test to pass, you have to change the string in the matcher to today's date
      expect(roomHelpers.formatDate(DateTime.utc(2022, 4, 5)), '5.4.2022');
    });

    group('formatRoomCategory test', () {
      test('format "tiered_lecture_theatres"', () async {
        expect(roomHelpers.formatRoomCategory('tiered_lecture_theatres'),
            'Tiered Lecture Theatres');
      });
      test('format "flat_floor_rooms"', () async {
        expect(roomHelpers.formatRoomCategory('flat_floor_rooms'),
            'Flat Floor Rooms');
      });
      test('format "theatres"', () async {
        expect(roomHelpers.formatRoomCategory('theatres'), 'Theatres');
      });
      test('format "pc_labs"', () async {
        expect(roomHelpers.formatRoomCategory('pc_labs'), 'PC Labs');
      });
      test('format "boardroom"', () async {
        expect(roomHelpers.formatRoomCategory('boardroom'), 'Boardroom');
      });
      test('format "classrooms"', () async {
        expect(roomHelpers.formatRoomCategory('classrooms'), 'Classrooms');
      });
      test('format "flat_floor"', () async {
        expect(roomHelpers.formatRoomCategory('flat_floor'), 'Flat Floor');
      });
      test('format "cabaret_style"', () async {
        expect(
            roomHelpers.formatRoomCategory('cabaret_style'), 'Cabaret Style');
      });
      test('format "plectrum_tables"', () async {
        expect(roomHelpers.formatRoomCategory('plectrum_tables'),
            'Plectrum Tables');
      });
      test('format "smaller_seminar_rooms"', () async {
        expect(roomHelpers.formatRoomCategory('smaller_seminar_rooms'),
            'Smaller Seminar Rooms');
      });
      test('format "larger_lecture_theatres"', () async {
        expect(roomHelpers.formatRoomCategory('larger_lecture_theatres'),
            'Larger Lecture Theatres');
      });
      test('format "group_work"', () async {
        expect(roomHelpers.formatRoomCategory('group_work'), 'Group Work');
      });
    });

    group('formatRoom test', () {
      test('format "gh018"', () async {
        expect(roomHelpers.formatRoom('the_great_hall', 'gh018'), 'GH018');
      });
      test('format "som239"', () async {
        expect(
            roomHelpers.formatRoom('school_of_management', 'som239'), 'SOM239');
      });
      test('format "college_127"', () async {
        expect(roomHelpers.formatRoom('the_college', 'college_127'),
            'College 127');
      });
      test('format "y_twyni_108"', () async {
        expect(roomHelpers.formatRoom('y_twyni', 'y_twyni_108'), 'Y Twyni 108');
      });
      test('format "seminar_room_5"', () async {
        expect(roomHelpers.formatRoom('fulton_house', 'seminar_room_5'),
            'Seminar Room 5');
      });
      test('format "faraday_lecture_theatre"', () async {
        expect(roomHelpers.formatRoom('faraday', 'faraday_lecture_theatre'),
            'Faraday Lecture Theatre');
      });
      test('format "james_lecture_theatre"', () async {
        expect(
            roomHelpers.formatRoom('james_callaghan', 'james_lecture_theatre'),
            'James Lecture Theatre');
      });
      test('format "jc_b-04"', () async {
        expect(roomHelpers.formatRoom('james_callaghan', 'jc_b-04'), 'JC B-04');
      });
      test('format "kh_330"', () async {
        expect(roomHelpers.formatRoom('keir_hardie', 'kh_330'), 'KH 330');
      });
    });
  });
}
