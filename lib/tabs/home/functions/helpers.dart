class RoomHelpers {
  String formatDate(DateTime date) {
    return date.day.toString() +
        '.' +
        date.month.toString() +
        '.' +
        date.year.toString();
  }

  bool doAlternativeFormat(String building) {
    return building == 'the_college' ||
        building == 'y_twyni' ||
        building == 'fulton_house';
  }

  String formatTitle(String title) {
    if (title == 'pc_labs') {
      return 'PC Labs';
    } else {
      return title
          .replaceAll('_', ' ')
          .split(' ')
          .map(
              (string) => string.replaceFirst(string[0], string[0].toUpperCase()))
          .join(' ');
    }
  }
}
