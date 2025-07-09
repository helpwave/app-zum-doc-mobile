import 'package:appzumdoc/components/doctors_office_card.dart';
import 'package:appzumdoc/components/request_card.dart';
import 'package:appzumdoc/datatypes/example_data.dart';
import 'package:appzumdoc/screens/doctor_list.dart';
import 'package:appzumdoc/theme/theme_model.dart';
import 'package:flutter/material.dart';

import '../theme/constants.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
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
                        horizontal: SpacingValues.md,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: SpacingValues.lg),
                          Text(
                            "App zum doc",
                            style:
                                (context.theme.textTheme.titleLarge ??
                                        TextStyle())
                                    .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: SpacingValues.xl),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.white,
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  context.theme.colorScheme.primary,
                                ),
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
                                spacing: SpacingValues.xs,
                                children: [
                                  Icon(Icons.search_rounded),
                                  Text("Arzt suchen"),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: SpacingValues.lg),
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: SpacingValues.md),
              ],
            ),
            Positioned(
              left: SpacingValues.md,
              right: SpacingValues.md,
              bottom: 0,
              height: 80,
              child: Row(
                spacing: SpacingValues.md,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(SpacingValues.md),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: SpacingValues.md,
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
                        padding: const EdgeInsets.all(SpacingValues.md),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: SpacingValues.md,
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
                        padding: const EdgeInsets.all(SpacingValues.md),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: SpacingValues.md,
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
            padding: EdgeInsets.all(SpacingValues.md).copyWith(bottom: 0),
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
                SizedBox(
                  height: 160,
                  child: ListView.separated(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return DoctorsOfficeCard(
                        doctorsOffice: ExampleData.doctorsOffice,
                        onTap: () {
                          // TODO navigate to doctors office
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(width: SpacingValues.sm),
                    clipBehavior: Clip.none,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const SizedBox(height: SpacingValues.md),
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
                    padding: EdgeInsets.only(bottom: SpacingValues.md),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return [
                        RequestCard(request: ExampleData.requestAppointment),
                        RequestCard(request: ExampleData.requestRecipe),
                        RequestCard(request: ExampleData.requestTransfer),
                      ][index];
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: SpacingValues.sm),
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
