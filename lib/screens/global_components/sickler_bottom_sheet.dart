import 'package:flutter/material.dart';

import 'global_components.dart';

class SicklerBottomSheet extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Widget child;
  const SicklerBottomSheet(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              height: 6,
              width: 42,
              decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8)),
            ),
            const SizedBox(height: 12),
            Text(title,
                style: theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(
              height: 16,
            ),
            child,
            const SizedBox(height: 32),
            SicklerButton(onPressed: onPressed, label: 'Continue'),
            const SizedBox(
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}
