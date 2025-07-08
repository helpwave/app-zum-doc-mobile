import 'package:appzumdoc/screens/doctor_list.dart';
import 'package:appzumdoc/theme/theme_model.dart';
import 'package:flutter/material.dart';

import '../theme/constants.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF095763), Color(0xFF4E97A2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 1],
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.md,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: Spacing.lg),
                          Text(
                            "App zum doc",
                            style: (context.theme.textTheme.titleLarge ?? TextStyle()).copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: Spacing.xl),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(Colors.white),
                                foregroundColor: WidgetStatePropertyAll(context.theme.colorScheme.primary),
                              ),
                              onPressed: () => {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DoctorList(),
                                  ),
                                ),
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                spacing: Spacing.xs,
                                children: [
                                  Icon(Icons.search_rounded),
                                  Text("Arzt suchen"),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: Spacing.lg),
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.md),
              ],
            ),
            Positioned(
              left: Spacing.md,
              right: Spacing.md,
              bottom: 0,
              height: 80,
              child: Row(
                spacing: Spacing.md,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(Spacing.md),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: Spacing.md,
                          children: [
                            Icon(Icons.medication_rounded),
                            Text("Rezept"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(Spacing.md),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: Spacing.md,
                          children: [
                            Icon(Icons.calendar_month_rounded),
                            Text("Termin"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(Spacing.md),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: Spacing.md,
                          children: [
                            Icon(Icons.double_arrow_rounded),
                            Text("Überweisung"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.all(Spacing.md).copyWith(bottom: 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Meine Ärzte"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).push(MaterialPageRoute(builder: (_) => DoctorList()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Alle anzeigen"),
                          Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: ListView.separated(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 155,
                        width: mediaQuery.size.width * 0.9 - Spacing.md,
                        child: Card(
                          margin: EdgeInsets.zero,
                          color: context.theme.colorScheme.primary,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(width: Spacing.sm),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Aktuell Anfragen"),
                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).push(MaterialPageRoute(builder: (_) => DoctorList()));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Alle anzeigen"),
                          Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: ListView.separated(
                    padding: EdgeInsets.only(bottom: Spacing.md),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 115,
                        child: Card(
                          margin: EdgeInsets.zero,
                          color: context.theme.colorScheme.primary,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: Spacing.sm),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
