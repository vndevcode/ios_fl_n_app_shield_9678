import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/faq/assistant_data.dart';
import 'package:ios_fl_n_app_shield_9678/models/chat_message.dart';
import 'package:ios_fl_n_app_shield_9678/models/faq_item_model.dart';
import 'package:ios_fl_n_app_shield_9678/state/app_scope.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_theme.dart';

/// Tab 5 — Guest Assistant. Predefined question/answer chat, no real AI.
class AssistantScreen extends StatefulWidget {
  const AssistantScreen({super.key});

  @override
  State<AssistantScreen> createState() => _AssistantScreenState();
}

class _AssistantScreenState extends State<AssistantScreen> {
  final ScrollController _scroll = ScrollController();

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _ask(FaqItemModel item) {
    AppScope.read(context).askAssistant(item.question, item.answer);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent + 200,
          duration: const Duration(milliseconds: 320),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final messages = AppScope.of(context).chat;
    // Questions the guest has not asked yet stay useful as chips.
    final asked = messages.where((m) => m.fromUser).map((m) => m.text).toSet();
    final remaining =
        AssistantData.questions.where((q) => !asked.contains(q.question));
    final chips = remaining.isEmpty ? AssistantData.questions : remaining;

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppTheme.screenPad, 14, AppTheme.screenPad, 14),
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: AppColors.emeraldDeep,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.neonDim, width: 1.3),
                  ),
                  child: const FaIcon(FontAwesomeIcons.solidCommentDots,
                      size: 18, color: AppColors.neon),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Guest Assistant', style: AppText.sectionTitle),
                      const SizedBox(height: 2),
                      Text('Tap a question to get quick visit support.',
                          style: AppText.caption),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.borderSoft, height: 1),
          Expanded(
            child: ListView.builder(
              controller: _scroll,
              padding: const EdgeInsets.fromLTRB(
                  AppTheme.screenPad, 18, AppTheme.screenPad, 18),
              itemCount: messages.length,
              itemBuilder: (context, i) => _Bubble(message: messages[i]),
            ),
          ),
          _SuggestionBar(chips: chips.toList(), onTap: _ask),
          _InputBar(),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({required this.message});
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final isUser = message.fromUser;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) ...[
            Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: AppColors.emeraldDeep,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.neonDim, width: 1.1),
              ),
              child: const FaIcon(FontAwesomeIcons.water,
                  size: 12, color: AppColors.neon),
            ),
          ],
          Flexible(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                color: isUser ? AppColors.emerald : AppColors.surface,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isUser ? 16 : 4),
                  bottomRight: Radius.circular(isUser ? 4 : 16),
                ),
                border: Border.all(
                  color: isUser ? AppColors.neonDim : AppColors.border,
                  width: 1.1,
                ),
              ),
              child: Text(
                message.text,
                style: AppText.body.copyWith(
                  color: AppColors.textCream,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestionBar extends StatelessWidget {
  const _SuggestionBar({required this.chips, required this.onTap});

  final List<FaqItemModel> chips;
  final ValueChanged<FaqItemModel> onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.screenPad),
        itemCount: chips.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, i) => _Chip(
          item: chips[i],
          onTap: () => onTap(chips[i]),
        ),
      ),
    );
  }
}

/// Suggestion chip.
class _Chip extends StatelessWidget {
  const _Chip({required this.item, required this.onTap});
  final FaqItemModel item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(999),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppColors.neonDim, width: 1.2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FaIcon(FontAwesomeIcons.solidCircleQuestion,
                    size: 13, color: AppColors.neon),
                const SizedBox(width: 8),
                Text(item.question,
                    style: AppText.label.copyWith(
                      color: AppColors.textCream,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Clean input-style area. Free typing is not required, so tapping it guides
/// the guest to the suggestion chips above.
class _InputBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.of(context).padding.bottom;
    return Container(
      padding: EdgeInsets.fromLTRB(
          AppTheme.screenPad, 12, AppTheme.screenPad, 12 + bottomPad),
      decoration: const BoxDecoration(
        color: AppColors.forestDeep,
        border: Border(top: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              decoration: BoxDecoration(
                color: AppColors.surfaceAlt,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: AppColors.border),
              ),
              child: Text(
                'Choose a prepared question above',
                style: AppText.body.copyWith(color: AppColors.textFaint),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.neonDim,
              shape: BoxShape.circle,
            ),
            child: const FaIcon(FontAwesomeIcons.arrowUp,
                size: 16, color: AppColors.textCream),
          ),
        ],
      ),
    );
  }
}
