import 'package:appzumdoc/datatypes/doctors_office.dart';
import 'package:appzumdoc/theme/constants.dart';
import 'package:appzumdoc/theme/theme_model.dart';
import 'package:flutter/material.dart';

class DoctorsOfficeCard extends StatelessWidget {
  final DoctorsOffice doctorsOffice;
  final void Function()? onTap;

  const DoctorsOfficeCard({super.key, required this.doctorsOffice, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(SpacingValues.md),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: SpacingValues.md,
              children: [
                Image(
                  image: NetworkImage(doctorsOffice.imageURL.toString()),
                  width: 110,
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctorsOffice.name,
                          style: context.theme.textTheme.titleMedium,
                        ),
                        Text(
                          doctorsOffice.specialty,
                          style: context.theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: SpacingValues.md,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: SpacingValues.xs,
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                color: doctorsOffice.isOpen
                                    ? context.theme.colorScheme.primary
                                    : Colors.red,
                                borderRadius: BorderRadius.circular(BorderRadiusValues.full),
                              ),
                            ),
                            Text(
                              doctorsOffice.isOpen
                                  ? "Praxis ist geöffnet"
                                  : "Praxis ist geschlossen",
                              style: context.theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: SpacingValues.xs,
                          children: [
                            Icon(Icons.call_rounded, size: 12),
                            Text(
                              doctorsOffice.phoneNumber,
                              style: context.theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
