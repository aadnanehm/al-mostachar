المستشار – Al Mostachar

تطبيق أندرويد (Flutter) للمعلومات القانونية المغربية. **المرحلة 1: نموذج أولي تجريبي.**
Application Android (Flutter) d'information juridique marocaine. **Étape 1 : prototype de démonstration.**

> ⚠️ **تنبيه قانوني / Avertissement**
> هذا التطبيق يقدم معلومات قانونية عامة ولا يغني عن استشارة محامٍ مغربي مختص.
> Cette application fournit des informations juridiques générales et ne remplace pas un avocat marocain qualifié.

## الحالة الحالية / État actuel

- المساعد **تجريبي (محاكاة)**: لا يعرف أي قانون ولا يذكر أي مادة قانونية، وكل جواب يحمل علامة «غير موثّق».
  L'assistant est **simulé** : il ne connaît aucune loi, ne cite aucun article, et chaque réponse est marquée « non vérifié ».
- لا يتم إرسال أي بيانات إلى الإنترنت. لا تُدخل معلومات سرية حقيقية.
  Aucune donnée n'est envoyée sur Internet. N'entrez pas d'informations confidentielles réelles.

## ما يحتويه / Contenu

- ثلاث لغات: العربية، الدارجة المغربية، الفرنسية (مع اتجاه RTL/LTR تلقائي).
- وضعان: مواطن (شرح مبسط) ومهني (تحليل معمق).
- عشرة مجالات قانونية: جنائي، مدني، أسرة، شغل، تجاري، إداري، عقاري، سير، دستوري، اجتماعي.
- شاشات: الرئيسية، المساعد، المستندات (واجهة مؤقتة)، المحاكاة (مخطط عام)، الإعدادات.
- هوية بصرية: كحلي داكن، أبيض، ذهبي.

## هيكل المشروع / Structure

```
lib/
  main.dart                          نقطة البداية والتنقل
  core/        theme, strings, app_state, domains
  services/    legal_assistant_service.dart   (الواجهة + المساعد التجريبي)
  screens/     home, chat, documents, simulator, settings
test/          widget_test.dart
docs/          ARCHITECTURE.md                (الهيكل وخارطة الطريق)
pubspec.yaml
```

## التشغيل / Lancer l'application

هذا المستودع يحتوي على الشفرة المصدرية فقط (بدون مجلد `android`).
Ce dépôt contient uniquement le code source (sans le dossier `android`).

1. ثبّت Flutter SDK و Android Studio (مجانيان) / Installez Flutter SDK et Android Studio (gratuits).
2. أنشئ مشروعاً جديداً باسم `al_mostachar` (Android فقط) / Créez un nouveau projet nommé `al_mostachar` (Android uniquement).
3. استبدل `lib/` و `test/` و `pubspec.yaml` بما في هذا المستودع / Remplacez `lib/`, `test/` et `pubspec.yaml` par ceux de ce dépôt.
4. نفّذ / Exécutez : `flutter pub get` ثم `flutter run` (على محاكي أو هاتف / sur émulateur ou téléphone).

## خارطة الطريق / Feuille de route

1. نموذج أولي (الحالي) / Prototype (actuel)
2. تحسينات: حفظ الإعدادات، شاشة ترحيب، أيقونة
3. تحليل المستندات (PDF/صور، OCR على الجهاز)
4. خادم آمن يحمل مفتاح الذكاء الاصطناعي (لا مفاتيح داخل التطبيق)
5. قاعدة نصوص قانونية موثّقة من مصادر رسمية (رقم القانون، المادة، تواريخ السريان)
6. محاكي المسطرة بمراجع وآجال موثقة
7. مراجعة الخصوصية والنشر على Google Play

التفاصيل في [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

## مبادئ الدقة والخصوصية / Exactitude et confidentialité

- لا يُذكر أي رقم مادة إلا إذا جاء من قاعدة بيانات قانونية موثّقة؛ وإلا يُعلَن أن المعلومة غير مؤكدة.
- لا مفاتيح API داخل التطبيق أبداً.
- لا تُستعمل ملفات قضايا حقيقية أو سرية أثناء التطوير؛ استعمل وثائق خيالية فقط.
