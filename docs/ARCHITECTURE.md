# المستشار – Al Mostachar: Architecture

## Big picture

```
 Android app (Flutter)  --HTTPS-->  Secure backend (stage 4+)  -->  AI model
        |                                   |
   screens only                    holds API keys (never in the app)
   talk to ONE interface                    |
   (LegalAssistantService)          Verified legal database (stage 5)
                                    (law name, number, article, validity dates)
```

Rule: the phone app NEVER contains an API key. It only talks to our backend.

## App folders (this stage)

| Path | Role |
|---|---|
| lib/main.dart | Starts the app, bottom navigation, RTL/LTR switch |
| lib/core/theme.dart | Navy / white / gold identity |
| lib/core/strings.dart | All texts in Arabic, Darija, French |
| lib/core/app_state.dart | Chosen language and mode (Citizen / Professional) |
| lib/core/domains.dart | The 10 legal domains |
| lib/services/legal_assistant_service.dart | The interface + a SIMULATED assistant |
| lib/screens/* | Home, chat, documents (placeholder), simulator, settings |

## Roadmap (one stage at a time, each confirmed by you)

1. **Prototype** (this one): screens, languages, modes, simulated assistant.
2. Polish: saved settings, onboarding/disclaimer screen, app icon, splash.
3. Documents: pick PDF/image, on-device OCR (Google ML Kit, free), document type detection, dates.
4. Backend: small free-tier server (e.g. Python FastAPI) that will hold the AI key; app calls it.
5. Legal knowledge base: ingest official texts (SGG Bulletin Officiel, adala.justice.gov.ma and similar official sources) with law number, article, validity dates; the AI may only answer from retrieved texts (RAG) and must say "unverified" otherwise.
6. Procedure simulator with sourced steps and deadlines.
7. Privacy review, Play Store listing, privacy policy, release build.

## Safety principles built in from day one

- The assistant returns a `LegalAnswer` with `verified` and `citations`; unverified answers are labelled in the UI.
- No article number is ever produced unless it comes from the verified database.
- Prototype sends no data anywhere. Use only fictional test documents.
