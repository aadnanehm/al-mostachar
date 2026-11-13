import 'package:flutter/material.dart';

import 'core/app_state.dart';
import 'core/strings.dart';
import 'core/theme.dart';
import 'screens/chat_screen.dart';
import 'screens/documents_screen.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/simulator_screen.dart';

void main() {
  runApp(const MostacharApp());
}

class MostacharApp extends StatelessWidget {
  const MostacharApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appState,
      builder: (context, _) {
        return MaterialApp(
          title: 'Al Mostachar',
          debugShowCheckedModeBanner: false,
          theme: buildTheme(),
          // Arabic / Darija = right-to-left, French = left-to-right.
          builder: (context, child) =>
              Directionality(textDirection: appState.direction, child: child!),
          home: const RootScreen(),
        );
      },
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const HomeScreen(),
      const ChatScreen(),
      const DocumentsScreen(),
      const SimulatorScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: SafeArea(child: IndexedStack(index: _index, children: pages)),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.home_outlined), label: t('tab_home')),
          NavigationDestination(
              icon: const Icon(Icons.chat_bubble_outline),
              label: t('tab_assistant')),
          NavigationDestination(
              icon: const Icon(Icons.description_outlined),
              label: t('tab_documents')),
          NavigationDestination(
              icon: const Icon(Icons.account_tree_outlined),
              label: t('tab_simulator')),
          NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              label: t('tab_settings')),
        ],
      ),
    );
  }
}
