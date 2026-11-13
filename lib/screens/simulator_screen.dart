import 'package:flutter/material.dart';

import '../core/app_state.dart';
import '../core/strings.dart';
import '../core/theme.dart';

/// Stage 1: a generic illustrative timeline only (no legal deadlines,
/// no article numbers). Real, sourced content comes in stage 6.
class SimulatorScreen extends StatelessWidget {
  const SimulatorScreen({super.key});

  static const _steps = [
    'step_complaint',
    'step_investigation',
    'step_prosecution',
    'step_trial',
    'step_judgment',
    'step_appeal',
    'step_enforcement',
  ];

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appState,
      builder: (context, _) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              t('simulator_title'),
              style: const TextStyle(
                color: Brand.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              t('simulator_note'),
              style: const TextStyle(color: Brand.muted, fontSize: 12, height: 1.5),
            ),
            const SizedBox(height: 20),
            for (var i = 0; i < _steps.length; i++)
              _StepRow(
                number: i + 1,
                label: t(_steps[i]),
                isLast: i == _steps.length - 1,
              ),
          ],
        );
      },
    );
  }
}

class _StepRow extends StatelessWidget {
  final int number;
  final String label;
  final bool isLast;
  const _StepRow(
      {required this.number, required this.label, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Brand.gold,
                child: Text('$number',
                    style: const TextStyle(
                        color: Brand.navy, fontWeight: FontWeight.bold)),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                      width: 2, color: Brand.gold.withValues(alpha: 0.4)),
                ),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Brand.navyCard,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(label,
                  style: const TextStyle(color: Brand.white, fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
