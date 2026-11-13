import 'package:flutter/material.dart';
import 'app_state.dart';

/// One legal domain shown on the home screen.
class LegalDomain {
  final String id;
  final IconData icon;
  final Map<AppLang, String> names;

  const LegalDomain(this.id, this.icon, this.names);

  String get name => names[appState.lang] ?? names[AppLang.fr]!;
}

const List<LegalDomain> legalDomains = [
  LegalDomain('criminal', Icons.gavel, {
    AppLang.ar: 'القانون الجنائي',
    AppLang.darija: 'القانون الجنائي',
    AppLang.fr: 'Droit pénal',
  }),
  LegalDomain('civil', Icons.balance, {
    AppLang.ar: 'القانون المدني',
    AppLang.darija: 'القانون المدني',
    AppLang.fr: 'Droit civil',
  }),
  LegalDomain('family', Icons.family_restroom, {
    AppLang.ar: 'قانون الأسرة',
    AppLang.darija: 'مدونة الأسرة',
    AppLang.fr: 'Droit de la famille',
  }),
  LegalDomain('labour', Icons.engineering, {
    AppLang.ar: 'قانون الشغل',
    AppLang.darija: 'قانون الشغل',
    AppLang.fr: 'Droit du travail',
  }),
  LegalDomain('commercial', Icons.store, {
    AppLang.ar: 'القانون التجاري',
    AppLang.darija: 'القانون التجاري',
    AppLang.fr: 'Droit commercial',
  }),
  LegalDomain('administrative', Icons.account_balance, {
    AppLang.ar: 'القانون الإداري',
    AppLang.darija: 'القانون الإداري',
    AppLang.fr: 'Droit administratif',
  }),
  LegalDomain('property', Icons.home_work, {
    AppLang.ar: 'العقار والملكية',
    AppLang.darija: 'العقار والملكية',
    AppLang.fr: 'Droit immobilier et foncier',
  }),
  LegalDomain('traffic', Icons.directions_car, {
    AppLang.ar: 'قانون السير',
    AppLang.darija: 'قانون السير',
    AppLang.fr: 'Code de la route',
  }),
  LegalDomain('constitutional', Icons.menu_book, {
    AppLang.ar: 'القانون الدستوري',
    AppLang.darija: 'القانون الدستوري',
    AppLang.fr: 'Droit constitutionnel',
  }),
  LegalDomain('social', Icons.health_and_safety, {
    AppLang.ar: 'القانون الاجتماعي',
    AppLang.darija: 'القانون الاجتماعي',
    AppLang.fr: 'Droit social',
  }),
];
