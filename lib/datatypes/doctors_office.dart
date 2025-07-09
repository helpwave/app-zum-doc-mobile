import 'package:flutter/material.dart';

class OpeningTime {
  final TimeOfDay start;
  final TimeOfDay end;

  OpeningTime({required this.start, required this.end})
      : assert(end.isAfter(start));

  bool get isOpen {
    TimeOfDay now = TimeOfDay.now();
    return now.isAfter(start) && now.isBefore(end);
  }
}

class WeeklyOpeningHours {
  final List<OpeningTime> monday;
  final List<OpeningTime> tuesday;
  final List<OpeningTime> wednesday;
  final List<OpeningTime> thursday;
  final List<OpeningTime> friday;
  final List<OpeningTime> saturday;
  final List<OpeningTime> sunday;

  const WeeklyOpeningHours({
    this.monday = const [],
    this.tuesday = const [],
    this.wednesday = const [],
    this.thursday = const [],
    this.friday = const [],
    this.saturday = const [],
    this.sunday = const [],
  });

  bool get isOpen {
    switch(DateTime.now().weekday) {
      case DateTime.monday:
        return monday.any((element) => element.isOpen);
      case DateTime.tuesday:
        return tuesday.any((element) => element.isOpen);
      case DateTime.wednesday:
        return wednesday.any((element) => element.isOpen);
      case DateTime.thursday:
        return thursday.any((element) => element.isOpen);
      case DateTime.friday:
        return friday.any((element) => element.isOpen);
      case DateTime.saturday:
        return saturday.any((element) => element.isOpen);
      case DateTime.sunday:
        return sunday.any((element) => element.isOpen);
      default:
        return false;
    }
  }
}

class DoctorsOffice {
  final String name;
  final String specialty;
  final WeeklyOpeningHours openingHours;
  final String phoneNumber;
  final Uri imageURL;

  const DoctorsOffice({
    required this.name,
    required this.specialty,
    required this.openingHours,
    required this.phoneNumber,
    required this.imageURL,
  });

  bool get isOpen => openingHours.isOpen;
}