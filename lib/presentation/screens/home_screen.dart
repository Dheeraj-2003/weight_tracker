import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weight_tracker/providers/weights/weights_provider.dart';
import 'package:weight_tracker/presentation/screens/add_weight_screen.dart';
import 'package:weight_tracker/presentation/widgets/plot/line_chart.dart';
import 'package:weight_tracker/presentation/widgets/weights_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
            children: [
              const Text(
                "Your weight through out the months",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 250, child: LineChartWidget()),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  ref.watch(weightsProvider.notifier).getWeights();
                },
                child: const Text(
                  "Recent Weight Entries",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Expanded(child: WeightsList()),
            ],
          ),
        ),
      ),
    );
  }
}
