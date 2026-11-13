import 'app_state.dart';

/// All visible text, in three languages.
/// To change a word in the app, edit it here.
const Map<String, Map<AppLang, String>> _texts = {
  'app_name': {
    AppLang.ar: 'المستشار',
    AppLang.darija: 'المستشار',
    AppLang.fr: 'Al Mostachar',
  },
  'tagline': {
    AppLang.ar: 'مساعدك القانوني المغربي الذكي',
    AppLang.darija: 'المساعد القانوني ديالك فالمغرب',
    AppLang.fr: 'Votre assistant juridique marocain',
  },
  'tab_home': {
    AppLang.ar: 'الرئيسية',
    AppLang.darija: 'الرئيسية',
    AppLang.fr: 'Accueil',
  },
  'tab_assistant': {
    AppLang.ar: 'المساعد',
    AppLang.darija: 'المساعد',
    AppLang.fr: 'Assistant',
  },
  'tab_documents': {
    AppLang.ar: 'المستندات',
    AppLang.darija: 'الوثائق',
    AppLang.fr: 'Documents',
  },
  'tab_simulator': {
    AppLang.ar: 'المحاكاة',
    AppLang.darija: 'المحاكاة',
    AppLang.fr: 'Simulateur',
  },
  'tab_settings': {
    AppLang.ar: 'الإعدادات',
    AppLang.darija: 'الإعدادات',
    AppLang.fr: 'Réglages',
  },
  'disclaimer': {
    AppLang.ar:
        'هذا التطبيق يقدم معلومات قانونية عامة ولا يغني عن استشارة محامٍ مغربي مختص.',
    AppLang.darija:
        'هاد التطبيق كيعطي غير معلومات قانونية عامة، وما كيعوضش المحامي المغربي المختص.',
    AppLang.fr:
        "Cette application fournit des informations juridiques générales et ne remplace pas un avocat marocain qualifié.",
  },
  'legal_domains': {
    AppLang.ar: 'المجالات القانونية',
    AppLang.darija: 'المجالات القانونية',
    AppLang.fr: 'Domaines juridiques',
  },
  'ask_hint': {
    AppLang.ar: 'اكتب سؤالك القانوني...',
    AppLang.darija: 'كتب السؤال القانوني ديالك...',
    AppLang.fr: 'Posez votre question juridique...',
  },
  'welcome_chat': {
    AppLang.ar: 'مرحباً! اسألني عن أي موضوع قانوني مغربي.',
    AppLang.darija: 'مرحبا! سولني على أي موضوع قانوني مغربي.',
    AppLang.fr: "Bonjour ! Posez-moi une question sur le droit marocain.",
  },
  'thinking': {
    AppLang.ar: 'جاري التحليل...',
    AppLang.darija: 'كنحلل...',
    AppLang.fr: 'Analyse en cours...',
  },
  'sources': {
    AppLang.ar: 'المراجع القانونية',
    AppLang.darija: 'المراجع القانونية',
    AppLang.fr: 'Références juridiques',
  },
  'not_verified': {
    AppLang.ar: 'غير موثّق: لا توجد مراجع قانونية مؤكدة لهذه الإجابة.',
    AppLang.darija: 'ماشي موثق: ماكاينش مراجع قانونية مأكدة لهاد الجواب.',
    AppLang.fr: 'Non vérifié : aucune référence juridique confirmée pour cette réponse.',
  },
  'documents_title': {
    AppLang.ar: 'تحليل المستندات القانونية',
    AppLang.darija: 'تحليل الوثائق القانونية',
    AppLang.fr: 'Analyse de documents juridiques',
  },
  'documents_desc': {
    AppLang.ar:
        'سيمكنك قريباً رفع ملف PDF أو صورة (محضر، استدعاء، عقد، حكم...) لاستخراج النص وشرح محتواه وتحديد التواريخ والآجال المهمة.',
    AppLang.darija:
        'قريب غادي تقدر ترفع PDF ولا تصويرة (محضر، استدعاء، عقد، حكم...) باش نستخرج النص ونشرح ليك المحتوى ونحدد التواريخ والآجال المهمة.',
    AppLang.fr:
        "Bientôt, vous pourrez importer un PDF ou une image (PV, convocation, contrat, jugement...) pour extraire le texte, l'expliquer et repérer les dates et délais importants.",
  },
  'coming_stage': {
    AppLang.ar: 'قيد الإنجاز: المرحلة 3',
    AppLang.darija: 'قيد الإنجاز: المرحلة 3',
    AppLang.fr: 'En préparation : étape 3',
  },
  'upload_btn': {
    AppLang.ar: 'رفع مستند',
    AppLang.darija: 'رفع وثيقة',
    AppLang.fr: 'Importer un document',
  },
  'simulator_title': {
    AppLang.ar: 'محاكي المسطرة القانونية',
    AppLang.darija: 'محاكي المسطرة القانونية',
    AppLang.fr: 'Simulateur de procédure',
  },
  'simulator_note': {
    AppLang.ar:
        'مخطط عام توضيحي فقط. التفاصيل والآجال الدقيقة سيتم ربطها بالنصوص القانونية الموثقة في مرحلة لاحقة.',
    AppLang.darija:
        'مخطط عام للتوضيح فقط. التفاصيل والآجال الدقيقة غادي نربطوها بالنصوص القانونية الموثقة من بعد.',
    AppLang.fr:
        "Schéma général à titre illustratif. Les détails et délais précis seront reliés aux textes juridiques vérifiés ultérieurement.",
  },
  'step_complaint': {
    AppLang.ar: 'تقديم الشكاية',
    AppLang.darija: 'تقديم الشكاية',
    AppLang.fr: 'Dépôt de la plainte',
  },
  'step_investigation': {
    AppLang.ar: 'البحث والتحقيق',
    AppLang.darija: 'البحث والتحقيق',
    AppLang.fr: 'Enquête',
  },
  'step_prosecution': {
    AppLang.ar: 'قرار النيابة العامة',
    AppLang.darija: 'قرار النيابة العامة',
    AppLang.fr: 'Décision du parquet',
  },
  'step_trial': {
    AppLang.ar: 'المحاكمة',
    AppLang.darija: 'المحاكمة',
    AppLang.fr: 'Procès',
  },
  'step_judgment': {
    AppLang.ar: 'صدور الحكم',
    AppLang.darija: 'صدور الحكم',
    AppLang.fr: 'Jugement',
  },
  'step_appeal': {
    AppLang.ar: 'الاستئناف',
    AppLang.darija: 'الاستئناف',
    AppLang.fr: 'Appel',
  },
  'step_enforcement': {
    AppLang.ar: 'التنفيذ',
    AppLang.darija: 'التنفيذ',
    AppLang.fr: 'Exécution',
  },
  'settings_language': {
    AppLang.ar: 'اللغة',
    AppLang.darija: 'اللغة',
    AppLang.fr: 'Langue',
  },
  'settings_mode': {
    AppLang.ar: 'وضع الاستخدام',
    AppLang.darija: 'نوع الاستعمال',
    AppLang.fr: "Mode d'utilisation",
  },
  'lang_ar': {
    AppLang.ar: 'العربية',
    AppLang.darija: 'العربية',
    AppLang.fr: 'Arabe',
  },
  'lang_darija': {
    AppLang.ar: 'الدارجة المغربية',
    AppLang.darija: 'الدارجة المغربية',
    AppLang.fr: 'Darija marocaine',
  },
  'lang_fr': {
    AppLang.ar: 'الفرنسية',
    AppLang.darija: 'الفرنسية',
    AppLang.fr: 'Français',
  },
  'mode_citizen': {
    AppLang.ar: 'مواطن (شرح مبسط)',
    AppLang.darija: 'مواطن (شرح بسيط)',
    AppLang.fr: 'Citoyen (explications simples)',
  },
  'mode_professional': {
    AppLang.ar: 'مهني (تحليل معمق)',
    AppLang.darija: 'مهني (تحليل معمق)',
    AppLang.fr: 'Professionnel (analyse détaillée)',
  },
  'privacy_note': {
    AppLang.ar:
        'في هذه النسخة التجريبية لا يتم إرسال أي بيانات إلى الإنترنت. لا تُدخل معلومات سرية حقيقية.',
    AppLang.darija:
        'فهاد النسخة التجريبية ما كيتصيفط حتى شي معلومة للأنترنت. ما تدخلش معلومات سرية حقيقية.',
    AppLang.fr:
        "Dans cette version de test, aucune donnée n'est envoyée sur Internet. N'entrez pas d'informations confidentielles réelles.",
  },
};

/// Returns the text for [key] in the current language.
String t(String key) {
  final entry = _texts[key];
  if (entry == null) return key;
  return entry[appState.lang] ?? entry[AppLang.fr] ?? key;
}
