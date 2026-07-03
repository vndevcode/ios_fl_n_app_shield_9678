import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/models/resort_place_model.dart';
import 'package:ios_fl_n_app_shield_9678/state/app_scope.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/app_back_button.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/primary_button.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/secondary_button.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/share_modal.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/solid_card.dart';

/// Secondary screen showing full details for a resort place.
class ResortPlaceDetailScreen extends StatelessWidget {
  const ResortPlaceDetailScreen({super.key, required this.place});

  final ResortPlaceModel place;

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final saved = state.isSaved(place.id);

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Image.asset(
                  place.imageAsset,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.scaffold.withValues(alpha: 0.55),
                            Colors.transparent,
                            AppColors.scaffold,
                          ],
                          stops: const [0.0, 0.4, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const AppBackButton(),
                          const Spacer(),
                          _SavePill(
                            saved: saved,
                            onTap: () => state.toggleSaved(place.id),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 30),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(place.title, style: AppText.title),
                const SizedBox(height: 12),
                Text(place.fullDescription, style: AppText.body),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _InfoTile(
                        icon: FontAwesomeIcons.clock,
                        label: 'Opening Hours',
                        value: place.openingHours,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _InfoTile(
                  icon: FontAwesomeIcons.locationDot,
                  label: 'Location',
                  value: place.location,
                ),
                const SizedBox(height: 24),
                Text('Highlights', style: AppText.sectionTitle),
                const SizedBox(height: 12),
                SolidCard(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Column(
                    children: [
                      for (final h in place.highlights)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 11),
                          child: Row(
                            children: [
                              const FaIcon(FontAwesomeIcons.solidCircleCheck,
                                  size: 15, color: AppColors.neon),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Text(h, style: AppText.body)),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 26),
                PrimaryButton(
                  label: saved ? 'Saved to Your List' : 'Save This Place',
                  icon: saved
                      ? FontAwesomeIcons.solidBookmark
                      : FontAwesomeIcons.bookmark,
                  onPressed: () => state.toggleSaved(place.id),
                ),
                const SizedBox(height: 12),
                SecondaryButton(
                  label: 'Share',
                  icon: FontAwesomeIcons.shareNodes,
                  onPressed: () => showShareModal(
                    context,
                    placeName: place.title,
                    location: place.location,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _SavePill extends StatelessWidget {
  const _SavePill({required this.saved, required this.onTap});
  final bool saved;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: saved ? AppColors.emeraldDark : AppColors.forestDeep,
      borderRadius: BorderRadius.circular(999),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: saved ? AppColors.neon : AppColors.border,
              width: 1.3,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                saved
                    ? FontAwesomeIcons.solidBookmark
                    : FontAwesomeIcons.bookmark,
                size: 14,
                color: saved ? AppColors.neon : AppColors.textCream,
              ),
              const SizedBox(width: 8),
              Text(
                saved ? 'Saved' : 'Save',
                style: AppText.label.copyWith(
                  color: saved ? AppColors.neon : AppColors.textCream,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  final FaIconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SolidCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.emeraldDeep,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.neonDim, width: 1.1),
            ),
            child: FaIcon(icon, size: 16, color: AppColors.neon),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppText.label),
                const SizedBox(height: 3),
                Text(value, style: AppText.body),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
