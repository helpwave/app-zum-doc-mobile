import 'package:appzumdoc/datatypes/doctors_office.dart';
import 'package:appzumdoc/datatypes/request.dart';
import 'package:flutter/material.dart';

class ExampleData {
  static OpeningTime openingTimeMorning = OpeningTime(
    start: TimeOfDay(hour: 8, minute: 00),
    end: TimeOfDay(hour: 12, minute: 00),
  );

  static OpeningTime openingTimeAfternoon = OpeningTime(
    start: TimeOfDay(hour: 13, minute: 00),
    end: TimeOfDay(hour: 18, minute: 00),
  );

  static DoctorsOffice doctorsOffice = DoctorsOffice(
    id: "test",
    name: "Dr. Müller",
    specialty: "Allgemeinmedizin - Innere Medizin",
    openingHours: WeeklyOpeningHours(
      monday: [
        ExampleData.openingTimeMorning,
        ExampleData.openingTimeAfternoon
      ],
      tuesday: [
        ExampleData.openingTimeMorning,
        ExampleData.openingTimeAfternoon
      ],
      wednesday: [
        ExampleData.openingTimeMorning,
        ExampleData.openingTimeAfternoon
      ],
      thursday: [
        ExampleData.openingTimeMorning,
        ExampleData.openingTimeAfternoon
      ],
      friday: [
        ExampleData.openingTimeMorning,
        ExampleData.openingTimeAfternoon
      ],
    ),
    phoneNumber: "+49 123456789",
    imageURL: Uri.parse("https://helpwave.de/favicon.ico"),
  );

  static Request requestRecipe = Request(
    type: RequestType.recipe,
    status: RequestStatus.pending,
    name: "Aciclovir 800 Heumann",
    doctorName: "Dr. Moser",
  );

  static Request requestTransfer = Request(
    type: RequestType.transfer,
    status: RequestStatus.accepted,
    name: "Radiologie",
    doctorName: "Dr. Moser",
  );

  static Request requestAppointment = Request(
    type: RequestType.appointment,
    status: RequestStatus.pending,
    name: "Termin 31.12.2025",
    doctorName: "Dr. Moser",
  );
}
