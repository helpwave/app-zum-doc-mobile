import 'package:appzumdoc/datatypes/request.dart';
import 'package:appzumdoc/theme/constants.dart';
import 'package:flutter/material.dart';

class RequestStatusChip extends StatelessWidget {
  final RequestStatus status;

  const RequestStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    String text = {
      RequestStatus.declined: "Abgelehnt",
      RequestStatus.pending: "In Bearbeitung",
      RequestStatus.accepted: "Bereit zur Abholung",
    }[status]!;

    Color textColor = {
      RequestStatus.declined: Color(0xFFDC576D),
      RequestStatus.pending: Color(0xFFEA9437),
      RequestStatus.accepted: Color(0xFF31BD03),
    }[status]!;

    Color backgroundColor = {
      RequestStatus.declined: Color(0xFFFBE0E2),
      RequestStatus.pending: Color(0xFFFBF8ED),
      RequestStatus.accepted:  Color(0xFFEBFFE6),
    }[status]!;

    Color outlineColor = {
      RequestStatus.declined: Color(0xFFFBE0E2),
      RequestStatus.pending: Color(0xFFF4A3A7),
      RequestStatus.accepted:  Color(0xFF82EF5E),
    }[status]!;

    IconData icon = {
      RequestStatus.declined: Icons.close_rounded,
      RequestStatus.pending: Icons.access_time_rounded,
      RequestStatus.accepted: Icons.check_rounded,
    }[status]!;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: BoxBorder.fromBorderSide(BorderSide(color: outlineColor)),
          borderRadius: BorderRadius.circular(BorderRadiusValues.sm),
      ),
      padding: EdgeInsets.all(6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: SpacingValues.xs,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: textColor,
              borderRadius: BorderRadius.circular(SpacingValues.xs),
            ),
            child: Center(
              child: Icon(icon, color: Colors.white, size: 14),
            ),
          ),
          Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}
