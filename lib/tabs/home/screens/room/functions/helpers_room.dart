class RoomHelpers {
  String formatDate(DateTime date) {
    return date.day.toString() +
        '.' +
        date.month.toString() +
        '.' +
        date.year.toString();
  }
}