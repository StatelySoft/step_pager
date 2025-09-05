import 'package:flutter/material.dart';
import 'package:step_pager/colors.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.explore,
            size: 80,
            color: activeIconColor,
          ),
          const SizedBox(height: 24),
          const Text(
            'Explore',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Discover new content and ideas',
            style: TextStyle(
              fontSize: 16,
              color: fgColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: buttonBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.search,
                  size: 48,
                  color: activeIconColor,
                ),
                SizedBox(height: 12),
                Text(
                  'Search & Browse',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Find exactly what you\'re looking for',
                  style: TextStyle(
                    fontSize: 14,
                    color: fgColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CuratePage extends StatelessWidget {
  const CuratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.collections_bookmark,
            size: 80,
            color: activeIconColor,
          ),
          const SizedBox(height: 24),
          const Text(
            'Curate',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Organize and save your favorites',
            style: TextStyle(
              fontSize: 16,
              color: fgColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: buttonBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.bookmark_add,
                  size: 48,
                  color: activeIconColor,
                ),
                SizedBox(height: 12),
                Text(
                  'Save & Organize',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Create collections of your favorite items',
                  style: TextStyle(
                    fontSize: 14,
                    color: fgColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MixPage extends StatelessWidget {
  const MixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shuffle,
            size: 80,
            color: activeIconColor,
          ),
          const SizedBox(height: 24),
          const Text(
            'Mix',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Combine and blend different elements',
            style: TextStyle(
              fontSize: 16,
              color: fgColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: buttonBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.auto_fix_high,
                  size: 48,
                  color: activeIconColor,
                ),
                SizedBox(height: 12),
                Text(
                  'Create & Blend',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Mix different styles and create something unique',
                  style: TextStyle(
                    fontSize: 14,
                    color: fgColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.play_arrow,
            size: 80,
            color: activeIconColor,
          ),
          const SizedBox(height: 24),
          const Text(
            'Play',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: titleColor,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Enjoy and interact with your content',
            style: TextStyle(
              fontSize: 16,
              color: fgColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: buttonBgColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                Icon(
                  Icons.volume_up,
                  size: 48,
                  color: activeIconColor,
                ),
                SizedBox(height: 12),
                Text(
                  'Listen & Enjoy',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Play your curated mix and enjoy the experience',
                  style: TextStyle(
                    fontSize: 14,
                    color: fgColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
