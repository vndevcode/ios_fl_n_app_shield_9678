import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/app_modal.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/primary_button.dart';

/// Shows a success confirmation modal with a checkmark, message and a
/// single dismiss button.
Future<void> showConfirmModal(
  BuildContext context, {
  required String title,
  required String message,
  String buttonLabel = 'Done',
}) {
  return showAppModal<void>(
    context: context,
    builder: (ctx) => _ConfirmBody(
      title: title,
      message: message,
      buttonLabel: buttonLabel,
    ),
  );
}

class _ConfirmBody extends StatelessWidget {
  const _ConfirmBody({
    required this.title,
    required this.message,
    required this.buttonLabel,
  });

  final String title;
  final String message;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 76,
          height: 76,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.emeraldDeep,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.neon, width: 1.6),
          ),
          child: const FaIcon(
            FontAwesomeIcons.check,
            size: 30,
            color: AppColors.neon,
          ),
        ),
        const SizedBox(height: 20),
        Text(title, style: AppText.sectionTitle, textAlign: TextAlign.center),
        const SizedBox(height: 10),
        Text(message, style: AppText.bodyMuted, textAlign: TextAlign.center),
        const SizedBox(height: 24),
        PrimaryButton(
          label: buttonLabel,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
