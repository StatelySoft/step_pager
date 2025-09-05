import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:step_pager/colors.dart';

export 'colors.dart';

class StepPager extends StatefulWidget {
  const StepPager({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.onStepChanged,
  });

  final List<StepPagerItem> steps;

  final int currentStep;
  final ValueChanged<int> onStepChanged;

  @override
  State<StepPager> createState() => _StepPagerState();
}

class _StepPagerState extends State<StepPager> {
  var _prevStep = 0;

  @override
  void didUpdateWidget(covariant StepPager oldWidget) {
    super.didUpdateWidget(oldWidget);
    _prevStep = oldWidget.currentStep;
  }

  void _onBackButtonTap() {
    if (widget.currentStep > 0) {
      widget.onStepChanged(widget.currentStep - 1);
    }
  }

  void _onForwardButtonTap() {
    if (widget.currentStep < widget.steps.length - 1) {
      widget.onStepChanged(widget.currentStep + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            StepPagerStepTitle(
              title: widget.steps[_prevStep].title,
              reverse: true,
            ),
            StepPagerStepTitle(
              title: widget.steps[widget.currentStep].title,
              reverse: false,
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ArrowButton(
              onTap: _onBackButtonTap,
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            SizedBox(width: 16),
            DecoratedBox(
              decoration: BoxDecoration(
                // color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: borderColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    for (var i = 0; i < widget.steps.length; i++)
                      StepPagerStepIcon(
                        icon: widget.steps[i].icon,
                        isCurrentStep: i == widget.currentStep,
                        onTap: () => widget.onStepChanged(i),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16),
            ArrowButton(
              onTap: _onForwardButtonTap,
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ],
    );
  }
}

class StepPagerStepTitle extends StatefulWidget {
  const StepPagerStepTitle({
    super.key,
    required this.title,
    required this.reverse,
  });

  final String title;

  final bool reverse;

  @override
  State<StepPagerStepTitle> createState() => _StepPagerStepTitleState();
}

class _StepPagerStepTitleState extends State<StepPagerStepTitle> {
  var _letters = <String>[];

  void _setLetters() {
    _letters = widget.title.split('');
  }

  @override
  void initState() {
    super.initState();
    _setLetters();
  }

  @override
  void didUpdateWidget(covariant StepPagerStepTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.title != oldWidget.title) {
      _setLetters();
    }
  }

  @override
  Widget build(BuildContext context) {
    double slideYBegin = .05;
    double? slideYEnd = 0;

    // Offset? scaleBegin = Offset(.5, .5);
    // Offset? scaleEnd = Offset(1, 1);
    Offset? scaleBegin;
    Offset? scaleEnd;
    Alignment? scaleAlignment = Alignment.bottomCenter;

    Offset? blurBegin = Offset(10, 10);
    Offset? blurEnd = Offset.zero;

    if (widget.reverse) {
      slideYBegin = 0;
      slideYEnd = -.5;

      scaleBegin = Offset(1.0, 1.0);
      scaleEnd = Offset.zero;
      scaleAlignment = Alignment.topCenter;

      blurBegin = Offset(1, 1);
      blurEnd = Offset(10, 10);
    }

    return Row(
      key: Key('${widget.title}-${widget.reverse}'),
      mainAxisSize: MainAxisSize.min,
      children:
          [
                for (var letter in _letters)
                  Text(
                    letter,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: titleColor,
                    ),
                  ),
              ]
              .animate(interval: 100.milliseconds)
              .blur(
                duration: 200.milliseconds,
                curve: Curves.easeInOut,
                begin: blurBegin,
                end: blurEnd,
              )
              .slideY(
                begin: slideYBegin,
                end: slideYEnd,
              )
              .scale(
                alignment: scaleAlignment,
                begin: scaleBegin,
                end: scaleEnd,
              ),
    );
  }
}

class StepPagerStepIcon extends StatelessWidget {
  const StepPagerStepIcon({
    super.key,
    required this.icon,
    required this.isCurrentStep,
    required this.onTap,
  });

  final Widget icon;

  final bool isCurrentStep;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Widget child;
    if (isCurrentStep) {
      child = IconTheme(
        data: IconThemeData(
          size: 32,
          color: activeIconColor,
        ),
        child: Animate(
          effects: [
            BlurEffect(
              // duration: 100.milliseconds,
              begin: Offset(10, 10),
              end: Offset.zero,
            ),
          ],
          child: icon,
        ),
      );
    } else {
      child = InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: dotColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: SizedBox.square(dimension: 14),
        ),
      );
    }

    return AnimatedPadding(
      padding: isCurrentStep
          ? const EdgeInsets.symmetric(horizontal: 8.0)
          : EdgeInsets.symmetric(horizontal: 6),
      duration: 300.milliseconds,
      child: child,
    );
  }
}

class ArrowButton extends StatelessWidget {
  const ArrowButton({super.key, required this.onTap, required this.icon});

  final VoidCallback onTap;

  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: buttonBgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: IconTheme(
            data: IconThemeData(color: fgColor),
            child: icon,
          ),
        ),
      ),
    );
  }
}

class StepPagerItem {
  const StepPagerItem({required this.title, required this.icon});

  final String title;
  final Widget icon;
}
