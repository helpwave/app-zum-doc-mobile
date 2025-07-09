import 'package:appzumdoc/datatypes/request.dart';
import 'package:appzumdoc/theme/constants.dart';
import 'package:flutter/material.dart';

class RequestTypeChip extends StatelessWidget {
  final RequestType type;

  const RequestTypeChip({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    String text = {
      RequestType.appointment: "Termin",
      RequestType.recipe: "Rezept",
      RequestType.transfer: "Überweisung",
    }[type]!;

    Color color = {
      RequestType.appointment: Color(0xFF458AB9),
      RequestType.recipe: Color(0xFF057986),
      RequestType.transfer: Color(0xFF771D9B),
    }[type]!;

    IconData icon = {
      RequestType.appointment: Icons.calendar_month_rounded,
      RequestType.recipe: Icons.medication_rounded,
      RequestType.transfer: Icons.double_arrow_rounded,
    }[type]!;

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(BorderRadiusValues.md),
      ),
      padding: EdgeInsets.symmetric(
        vertical: SpacingValues.sm,
        horizontal: SpacingValues.md,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: SpacingValues.sm,
        children: [
          Icon(icon, color: Colors.white),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
