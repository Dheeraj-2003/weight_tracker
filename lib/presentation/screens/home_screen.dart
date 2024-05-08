import 'package:flutter/material.dart';
import 'package:weight_tracker/data/models/weight.dart';
import 'package:weight_tracker/presentation/screens/add_weight_screen.dart';
import 'package:weight_tracker/presentation/widgets/common_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Weight> weightsList = weights;

  void _openAddCategoryOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const AddWeightScreen();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddCategoryOverlay,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Weight Tracker"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                "Recent Weight Entries",
                style: TextStyle(fontSize: 18),
              ),
              weightsList.isEmpty
                  ? const Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Added weights will be shown here."),
                      ],
                    )
                  : ListView.builder(
                      itemCount: weightsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CommonListTile(
                            title: weightsList[index].weight.toString(),
                            subTitle: weightsList[index].time.toString(),
                          ))
            ],
          ),
        ),
      ),
    );
  }
}
