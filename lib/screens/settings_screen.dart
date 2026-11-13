import 'package:flutter/material.dart';

import '../core/app_state.dart';
import '../core/strings.dart';
import '../core/theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appState,
      builder: (context, _) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _title(t('settings_language')),
            _option('lang_ar', appState.lang == AppLang.ar,
                () => appState.setLang(AppLang.ar)),
            _option('lang_darija', appState.lang == AppLang.darija,
                () => appState.setLang(AppLang.darija)),
            _option('lang_fr', appState.lang == AppLang.fr,
                () => appState.setLang(AppLang.fr)),
            const SizedBox(height: 24),
            _title(t('settings_mode')),
            _option('mode_citizen', appState.mode == UserMode.citizen,
                () => appState.setMode(UserMode.citizen)),
            _option('mode_professional', appState.mode == UserMode.professional,
                () => appState.setMode(UserMode.professional)),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Brand.gold.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${t('disclaimer')}\n\n${t('privacy_note')}',
                style: const TextStyle(
                    color: Brand.muted, fontSize: 12, height: 1.5),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _title(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text,
            style: const TextStyle(
                color: Brand.gold, fontSize: 16, fontWeight: FontWeight.bold)),
      );

  Widget _option(String key, bool selected, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Brand.navyCard,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            color: selected ? Brand.gold : Colors.transparent, width: 1.5),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(t(key), style: const TextStyle(color: Brand.white)),
        trailing: Icon(
          selected ? Icons.check_circle : Icons.circle_outlined,
          color: selected ? Brand.gold : Brand.muted,
        ),
      ),
    );
  }
}
