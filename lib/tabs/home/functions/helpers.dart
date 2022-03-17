class RoomHelpers {
  String formatDate(DateTime date) {
    return date.day.toString() +
        '.' +
        date.month.toString() +
        '.' +
        date.year.toString();
  }

  String formatRoomCategory(String category) {
    if (category == 'pc_labs') {
      return 'PC Labs';
    } else {
      return category
          .replaceAll('_', ' ')
          .split(' ')
          .map((string) =>
              string.replaceFirst(string[0], string[0].toUpperCase()))
          .join(' ');
    }
  }

  String formatRoom(String building, String room) {
    if (building == 'pc_labs') {
      return 'PC Labs';
    } else if (building == 'james_callaghan' || building == 'keir_hardie') {
      if (room == 'james_lecture_theatre') {
        return 'James Lecture Theatre';
      } else {
        return room
            .replaceAll('_', ' ')
            .split(' ')
            .map((string) => string.replaceFirst(string[0] + string[1],
                string[0].toUpperCase() + string[1].toUpperCase()))
            .join(' ');
      }
    } else if (building == 'the_college' ||
        building == 'y_twyni' ||
        building == 'fulton_house' ||
        building == 'faraday') {
      return room
          .replaceAll('_', ' ')
          .split(' ')
          .map((string) =>
              string.replaceFirst(string[0], string[0].toUpperCase()))
          .join(' ');
    } else {
      return room.toUpperCase();
    }
  }
}
