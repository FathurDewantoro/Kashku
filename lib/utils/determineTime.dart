String determineTimeOfDay(DateTime dateTime) {
  int hour = dateTime.hour;

  if (hour >= 5 && hour < 12) {
    return 'Pagi ✨';
  } else if (hour >= 12 && hour < 17) {
    return 'Siang 🌤';
  } else if (hour >= 17 && hour < 20) {
    return 'Sore 🌥';
  } else {
    return 'Malam 🌑';
  }
}
