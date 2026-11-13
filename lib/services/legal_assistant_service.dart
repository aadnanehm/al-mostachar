import '../core/app_state.dart';

/// A legal reference: law name, law number, article, validity date.
/// Real references will only come from a verified legal database (stage 5).
class LegalCitation {
  final String lawName;
  final String lawNumber;
  final String article;
  final String validAsOf;

  const LegalCitation({
    required this.lawName,
    required this.lawNumber,
    required this.article,
    required this.validAsOf,
  });
}

/// The answer returned by any assistant implementation.
class LegalAnswer {
  final String text;
  final List<LegalCitation> citations;

  /// false = the answer could not be backed by a verified legal source.
  final bool verified;

  const LegalAnswer({
    required this.text,
    this.citations = const [],
    this.verified = false,
  });
}

/// The contract every assistant must follow.
/// The screens only know about this class, so later we can swap the
/// simulated assistant for a real one (calling our secure backend)
/// without touching any screen.
abstract class LegalAssistantService {
  Future<LegalAnswer> ask({
    required String question,
    required AppLang lang,
    required UserMode mode,
    String? domainId,
  });
}

/// STAGE 1 ONLY: simulated assistant. It does not know any law and
/// never cites any article. It only demonstrates the interface.
class MockLegalAssistant implements LegalAssistantService {
  @override
  Future<LegalAnswer> ask({
    required String question,
    required AppLang lang,
    required UserMode mode,
    String? domainId,
  }) async {
    await Future.delayed(const Duration(milliseconds: 900));

    final isPro = mode == UserMode.professional;
    String text;
    switch (lang) {
      case AppLang.ar:
        text = 'هذه إجابة تجريبية. لم يتم بعد ربط المساعد بقاعدة النصوص القانونية المغربية، '
            'لذلك لا يمكنني الآن تقديم مرجع قانوني مؤكد.\n\n'
            'سؤالك: «$question»\n'
            'الوضع الحالي: ${isPro ? 'مهني' : 'مواطن'}.';
        break;
      case AppLang.darija:
        text = 'هادا جواب تجريبي. المساعد باقي ما تربطش بقاعدة النصوص القانونية المغربية، '
            'وبالتالي ما نقدرش نعطيك دابا مرجع قانوني مأكد.\n\n'
            'السؤال ديالك: «$question»\n'
            'الوضع الحالي: ${isPro ? 'مهني' : 'مواطن'}.';
        break;
      case AppLang.fr:
        text = "Ceci est une réponse de démonstration. L'assistant n'est pas encore relié à la "
            "base des textes juridiques marocains ; je ne peux donc pas fournir de référence "
            "juridique confirmée.\n\n"
            "Votre question : « $question »\n"
            "Mode actuel : ${isPro ? 'professionnel' : 'citoyen'}.";
        break;
    }
    return LegalAnswer(text: text, verified: false);
  }
}

/// One shared assistant. In a later stage this line will become:
///   final LegalAssistantService assistant = BackendLegalAssistant();
final LegalAssistantService assistant = MockLegalAssistant();
