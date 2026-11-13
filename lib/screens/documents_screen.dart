import 'package:flutter/material.dart';

import '../core/app_state.dart';
import '../core/strings.dart';
import '../core/theme.dart';

/// Placeholder for stage 3 (document upload + analysis).
class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appState,
      builder: (context, _) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.description, color: Brand.gold, size: 72),
                const SizedBox(height: 16),
                Text(
                  t('documents_title'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Brand.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  t('documents_desc'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Brand.muted, height: 1.5),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: null, // enabled in stage 3
                  icon: const Icon(Icons.upload_file),
                  label: Text(t('upload_btn')),
                ),
                const SizedBox(height: 8),
                Text(
                  t('coming_stage'),
                  style: const TextStyle(color: Brand.goldSoft, fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
