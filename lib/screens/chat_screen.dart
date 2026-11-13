import 'package:flutter/material.dart';

import '../core/app_state.dart';
import '../core/domains.dart';
import '../core/strings.dart';
import '../core/theme.dart';
import '../services/legal_assistant_service.dart';

class _Message {
  final String text;
  final bool fromUser;
  final LegalAnswer? answer;
  const _Message(this.text, {required this.fromUser, this.answer});
}

class ChatScreen extends StatefulWidget {
  final LegalDomain? domain;
  const ChatScreen({super.key, this.domain});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = TextEditingController();
  final _scroll = ScrollController();
  final List<_Message> _messages = [];
  bool _waiting = false;

  @override
  void dispose() {
    _controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final question = _controller.text.trim();
    if (question.isEmpty || _waiting) return;

    setState(() {
      _messages.add(_Message(question, fromUser: true));
      _waiting = true;
      _controller.clear();
    });
    _scrollDown();

    final answer = await assistant.ask(
      question: question,
      lang: appState.lang,
      mode: appState.mode,
      domainId: widget.domain?.id,
    );

    if (!mounted) return;
    setState(() {
      _messages.add(_Message(answer.text, fromUser: false, answer: answer));
      _waiting = false;
    });
    _scrollDown();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appState,
      builder: (context, _) {
        return Column(
          children: [
            Expanded(
              child: ListView(
                controller: _scroll,
                padding: const EdgeInsets.all(16),
                children: [
                  _bubble(t('welcome_chat'), fromUser: false),
                  for (final m in _messages)
                    _bubble(m.text, fromUser: m.fromUser, answer: m.answer),
                  if (_waiting) _bubble(t('thinking'), fromUser: false),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Brand.white),
                      minLines: 1,
                      maxLines: 4,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _send(),
                      decoration: InputDecoration(hintText: t('ask_hint')),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(
                    style: IconButton.styleFrom(
                      backgroundColor: Brand.gold,
                      foregroundColor: Brand.navy,
                    ),
                    onPressed: _send,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _bubble(String text, {required bool fromUser, LegalAnswer? answer}) {
    return Align(
      alignment:
          fromUser ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.82),
        decoration: BoxDecoration(
          color: fromUser ? Brand.gold : Brand.navyCard,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: fromUser ? Brand.navy : Brand.white,
                height: 1.5,
              ),
            ),
            if (answer != null && !answer.verified) ...[
              const SizedBox(height: 8),
              Text(
                t('not_verified'),
                style: const TextStyle(
                    color: Brand.goldSoft, fontSize: 12, height: 1.4),
              ),
            ],
            if (answer != null && answer.citations.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(t('sources'),
                  style: const TextStyle(
                      color: Brand.gold, fontWeight: FontWeight.bold)),
              for (final c in answer.citations)
                Text(
                  '${c.lawName} (${c.lawNumber}) – ${c.article}',
                  style: const TextStyle(color: Brand.muted, fontSize: 12),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
