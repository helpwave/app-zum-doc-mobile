import 'package:appzumdoc/datatypes/doctors_office.dart';
import 'package:flutter/material.dart';

OpeningTime exampleOpeningTimeMorning = OpeningTime(
  start: TimeOfDay(hour: 8, minute: 00),
  end: TimeOfDay(hour: 12, minute: 00),
);

OpeningTime exampleOpeningTimeAfternoon = OpeningTime(
  start: TimeOfDay(hour: 13, minute: 00),
  end: TimeOfDay(hour: 18, minute: 00),
);

final exampleDoctorsOffice = DoctorsOffice(
  name: "Dr. Müller",
  specialty: "Allgemeinmedizin - Innere Medizin",
  openingHours: WeeklyOpeningHours(
    monday: [exampleOpeningTimeMorning, exampleOpeningTimeAfternoon],
    tuesday: [exampleOpeningTimeMorning, exampleOpeningTimeAfternoon],
    wednesday: [exampleOpeningTimeMorning, exampleOpeningTimeAfternoon],
    thursday: [exampleOpeningTimeMorning, exampleOpeningTimeAfternoon],
    friday: [exampleOpeningTimeMorning, exampleOpeningTimeAfternoon],
  ),
  phoneNumber: "+49 123456789",
  imageURL: Uri.parse("https://helpwave.de/favicon.ico"),
);
