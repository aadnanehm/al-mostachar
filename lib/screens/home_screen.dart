import 'package:flutter/material.dart';

import '../core/app_state.dart';
import '../core/domains.dart';
import '../core/strings.dart';
import '../core/theme.dart';
import 'chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appState,
      builder: (context, _) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Brand.navyLight, Brand.navyCard],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Brand.gold.withValues(alpha: 0.5)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.balance, color: Brand.gold, size: 48),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'المستشار · Al Mostachar',
                          style: const TextStyle(
                            color: Brand.gold,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          t('tagline'),
                          style: const TextStyle(color: Brand.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Disclaimer
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Brand.gold.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Brand.gold, size: 20),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      t('disclaimer'),
                      style: const TextStyle(
                          color: Brand.muted, fontSize: 12, height: 1.4),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Text(
              t('legal_domains'),
              style: const TextStyle(
                color: Brand.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                for (final d in legalDomains) _DomainTile(domain: d),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _DomainTile extends StatelessWidget {
  final LegalDomain domain;
  const _DomainTile({required this.domain});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Brand.navyCard,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => Scaffold(
                appBar: AppBar(title: Text(domain.name)),
                body: SafeArea(child: ChatScreen(domain: domain)),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(domain.icon, color: Brand.gold, size: 30),
              const SizedBox(height: 8),
              Text(
                domain.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Brand.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
