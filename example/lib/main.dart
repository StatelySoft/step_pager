import 'package:flutter/material.dart';
// import 'package:step_pager/colors.dart';
import 'package:step_pager/step_pager.dart';
import 'package:step_pager_example/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Step Pager demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Step Pager demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentStep = 0;

  void onStepChanged(int value) {
    setState(() {
      currentStep = value;
    });
  }

  Widget _getCurrentPage() {
    switch (currentStep) {
      case 0:
        return const ExplorePage();
      case 1:
        return const CuratePage();
      case 2:
        return const MixPage();
      case 3:
        return const PlayPage();
      default:
        return const ExplorePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,

        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: _getCurrentPage()),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: StepPager(
                  steps: [
                    StepPagerItem(
                      title: 'Explore',
                      icon: const Icon(Icons.explore),
                    ),
                    StepPagerItem(
                      title: 'Curate',
                      icon: const Icon(Icons.collections_bookmark),
                    ),
                    StepPagerItem(
                      title: 'Mix',
                      icon: const Icon(Icons.shuffle),
                    ),
                    StepPagerItem(
                      title: 'Play',
                      icon: const Icon(Icons.play_arrow),
                    ),
                  ],
                  currentStep: currentStep,
                  onStepChanged: onStepChanged,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
