import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/app_modal.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/primary_button.dart';

/// Custom share modal used as the fallback when a native share sheet is not
/// available. Presents a few share destinations and a copy-link action.
Future<void> showShareModal(
  BuildContext context, {
  required String placeName,
  required String location,
}) {
  return showAppModal<void>(
    context: context,
    builder: (ctx) => _ShareBody(placeName: placeName, location: location),
  );
}

class _ShareBody extends StatelessWidget {
  const _ShareBody({required this.placeName, required this.location});

  final String placeName;
  final String location;

  @override
  Widget build(BuildContext context) {
    const options = [
      (FontAwesomeIcons.solidComment, 'Message'),
      (FontAwesomeIcons.solidEnvelope, 'Email'),
      (FontAwesomeIcons.link, 'Copy Link'),
      (FontAwesomeIcons.qrcode, 'Show Code'),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModalTitleBar(
          title: 'Share this resort place',
          subtitle: 'Share this resort place with a friend.',
        ),
        const SizedBox(height: 18),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceAlt,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const FaIcon(FontAwesomeIcons.locationDot,
                      size: 14, color: AppColors.neon),
                  const SizedBox(width: 8),
                  Text('Niagara Service Resort',
                      style: AppText.caption.copyWith(color: AppColors.neon)),
                ],
              ),
              const SizedBox(height: 10),
              Text(placeName, style: AppText.cardTitle),
              const SizedBox(height: 4),
              Text(location, style: AppText.bodyMuted),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final (icon, label) in options)
              _ShareOption(
                icon: icon,
                label: label,
                onTap: () async {
                  await Clipboard.setData(
                    ClipboardData(
                      text:
                          '$placeName — $location, Niagara Service Resort',
                    ),
                  );
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppColors.surfaceElevated,
                        content: Text(
                          'Shared "$placeName" via $label',
                          style: AppText.body,
                        ),
                      ),
                    );
                    Navigator.of(context).pop();
                  }
                },
              ),
          ],
        ),
        const SizedBox(height: 22),
        PrimaryButton(
          label: 'Done',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}

class _ShareOption extends StatelessWidget {
  const _ShareOption({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final FaIconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 62,
              height: 62,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border),
              ),
              child: FaIcon(icon, size: 20, color: AppColors.neon),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: AppText.caption),
      ],
    );
  }
}
