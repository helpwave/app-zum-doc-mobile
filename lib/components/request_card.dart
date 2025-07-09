import 'package:appzumdoc/components/request_status_chip.dart';
import 'package:appzumdoc/components/request_type_chip.dart';
import 'package:appzumdoc/datatypes/request.dart';
import 'package:appzumdoc/theme/constants.dart';
import 'package:appzumdoc/theme/theme_model.dart';
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final Request request;
  final void Function()? onTap;

  const RequestCard({super.key, required this.request, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(SpacingValues.md),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: SpacingValues.md,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(request.doctorName, style: context.theme.textTheme.bodySmall),
                  Text(request.name, style: context.theme.textTheme.titleMedium),
                  SizedBox(height: SpacingValues.sm),
                  RequestStatusChip(status: request.status),
                ],
              ),
              RequestTypeChip(type: request.type),
            ],
          ),
        ),
      ),
    );
  }
}