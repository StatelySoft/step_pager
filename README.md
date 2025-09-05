# Step Pager

A beautiful, animated step pager widget for Flutter that provides smooth transitions between different steps or pages in your app.

### Basic Example

```dart
import 'package:flutter/material.dart';
import 'package:step_pager/step_pager.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int currentStep = 0;

  void onStepChanged(int step) {
    setState(() {
      currentStep = step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _getCurrentPage(),
          ),
          StepPager(
            steps: [
              StepPagerItem(
                title: 'Explore',
                icon: Icon(Icons.explore),
              ),
              StepPagerItem(
                title: 'Curate',
                icon: Icon(Icons.collections_bookmark),
              ),
              StepPagerItem(
                title: 'Mix',
                icon: Icon(Icons.shuffle),
              ),
              StepPagerItem(
                title: 'Play',
                icon: Icon(Icons.play_arrow),
              ),
            ],
            currentStep: currentStep,
            onStepChanged: onStepChanged,
          ),
        ],
      ),
    );
  }

  Widget _getCurrentPage() {
    switch (currentStep) {
      case 0:
        return ExplorePage();
      case 1:
        return CuratePage();
      case 2:
        return MixPage();
      case 3:
        return PlayPage();
      default:
        return ExplorePage();
    }
  }
}
```

### StepPagerItem

Each step is defined using a `StepPagerItem`:

```dart
StepPagerItem(
  title: 'Your Step Title',  // Required: The title displayed above the pager
  icon: Icon(Icons.your_icon), // Required: The icon shown when this step is active
)
```

### StepPager Properties

- `steps` (required): List of `StepPagerItem` objects defining each step
- `currentStep` (required): The currently active step index
- `onStepChanged` (required): Callback function called when the step changes

## Credits

Design inspiration from [@nitishkmrk](https://x.com/nitishkmrk/status/1960619801598152902) on X/Twitter.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
