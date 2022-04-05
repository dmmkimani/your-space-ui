import 'package:flutter_test/flutter_test.dart';
import 'package:project/tabs/helpers.dart';

void main() {
  late HelperFunctions helpers;

  setUp(() {
    helpers = HelperFunctions();
  });

  group('all methods test', () {
    test('formatDate test', () {
      expect(helpers.formatDate(DateTime.utc(2022, 4, 5)), '5 Apr 2022');
    });
    test('parseDate test', () {
      expect(helpers.parseDate('5.4.2022', '00:00'), DateTime.utc(2022, 4, 5));
    });
    test('timeSlotToInt test', () {
      expect(helpers.timeSlotToInt('05:00'), 5);
      expect(helpers.timeSlotToInt('15:00'), 15);
    });
    test('intToTimeSlot', () {
      expect(helpers.intToTimeSlot(5), '05:00');
      expect(helpers.intToTimeSlot(15), '15:00');
    });
  });
}