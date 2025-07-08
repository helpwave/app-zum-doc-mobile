import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Flexible(child: ListView(children: [
        Row(
          children: [
            Text("Meine Ärzte"),
            TextButton(
              onPressed: () {
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Alle anzeigen"),
                  Icon(Icons.chevron_right_rounded),
                ],
              ),
            )
          ],
        ),
      ]))],
    );
  }
}
