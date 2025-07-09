import 'package:appzumdoc/components/request_card.dart';
import 'package:appzumdoc/datatypes/example_data.dart';
import 'package:appzumdoc/datatypes/request.dart';
import 'package:appzumdoc/theme/constants.dart';
import 'package:appzumdoc/theme/theme_model.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatefulWidget {
  final RequestType initialTab;

  const RequestScreen({super.key, this.initialTab = RequestType.recipe});

  @override
  State<StatefulWidget> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen>
    with TickerProviderStateMixin {
  final requests = [
    ExampleData.requestAppointment,
    ExampleData.requestTransfer,
    ExampleData.requestRecipe,
    ExampleData.requestTransfer,
    ExampleData.requestRecipe,
  ];

  final mapping = [
    RequestType.appointment,
    RequestType.recipe,
    RequestType.transfer,
  ];

  @override
  Widget build(BuildContext context) {
    List<Request> appointments = requests
        .where((element) => element.type == RequestType.appointment)
        .toList();
    List<Request> recipes = requests
        .where((element) => element.type == RequestType.recipe)
        .toList();
    List<Request> transfers = requests
        .where((element) => element.type == RequestType.transfer)
        .toList();

    final TabController controller = TabController(length: 3, vsync: this);

    return Scaffold(
      appBar: AppBar(title: Text("Alle Anfragen")),
      body: Padding(
        padding: const EdgeInsets.all(SpacingValues.lg).copyWith(bottom: 0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(BorderRadiusValues.full),
              ),
              child: TabBar(
                controller: controller,
                tabs: ["Termine", "Rezepte", "Überweisung"]
                    .map(
                      (value) => Padding(
                        padding: EdgeInsets.symmetric(
                          //vertical: SpacingValues.sm,
                        ),
                        child: Tab(
                          text: value,
                          iconMargin: EdgeInsets.zero,
                        ),
                      ),
                    )
                    .toList(),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    BorderRadiusValues.full,
                  ),
                  color: context.theme.colorScheme.primary,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                padding: EdgeInsets.all(SpacingValues.xs),
                dividerHeight: 0,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.black87,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: SpacingValues.lg),
                child: TabBarView(
                  controller: controller,
                  children: [
                    ListView.separated(
                      itemBuilder: (context, index) {
                        return RequestCard(request: appointments[index]);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: SpacingValues.md),
                      itemCount: appointments.length,
                    ),
                    ListView.separated(
                      itemBuilder: (context, index) {
                        return RequestCard(request: recipes[index]);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: SpacingValues.md),
                      itemCount: recipes.length,
                    ),
                    ListView.separated(
                      itemBuilder: (context, index) {
                        return RequestCard(request: transfers[index]);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: SpacingValues.md),
                      itemCount: transfers.length,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
