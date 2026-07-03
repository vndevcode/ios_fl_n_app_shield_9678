import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/models/resort_place_model.dart';
import 'package:ios_fl_n_app_shield_9678/places/places_data.dart';
import 'package:ios_fl_n_app_shield_9678/screens/resort/resort_place_detail_screen.dart';
import 'package:ios_fl_n_app_shield_9678/screens/resort/widgets/resort_place_card.dart';
import 'package:ios_fl_n_app_shield_9678/state/app_scope.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_theme.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/empty_state_view.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/screen_header.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/segmented_control.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/share_modal.dart';

/// Tab 3 — Resort Places, with Places and Saved internal tabs.
class ResortScreen extends StatefulWidget {
  const ResortScreen({super.key});

  @override
  State<ResortScreen> createState() => _ResortScreenState();
}

class _ResortScreenState extends State<ResortScreen> {
  int _segment = 0;

  void _openDetail(ResortPlaceModel place) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ResortPlaceDetailScreen(place: place),
      ),
    );
  }

  void _share(ResortPlaceModel place) {
    showShareModal(context, placeName: place.title, location: place.location);
  }

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final allPlaces = PlacesData.places;
    final saved =
        allPlaces.where((p) => state.savedPlaceIds.contains(p.id)).toList();
    final showingSaved = _segment == 1;
    final list = showingSaved ? saved : allPlaces;

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppTheme.screenPad, 14, AppTheme.screenPad, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ScreenHeader(
                  overline: 'Explore the building',
                  title: 'Resort Places',
                  subtitle:
                      'Explore useful places inside the resort and save what you want to visit.',
                ),
                const SizedBox(height: 18),
                SegmentedControl(
                  segments: [
                    'Places',
                    'Saved${saved.isEmpty ? '' : ' (${saved.length})'}',
                  ],
                  index: _segment,
                  onChanged: (i) => setState(() => _segment = i),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
          Expanded(
            child: (showingSaved && saved.isEmpty)
                ? EmptyStateView(
                    icon: FontAwesomeIcons.solidBookmark,
                    title: 'No Saved Places',
                    subtitle:
                        'Save resort places you want to remember during your visit.',
                    actionLabel: 'Browse Places',
                    onAction: () => setState(() => _segment = 0),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(
                        AppTheme.screenPad, 14, AppTheme.screenPad, 28),
                    itemCount: list.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 16),
                    itemBuilder: (context, i) {
                      final place = list[i];
                      return ResortPlaceCard(
                        place: place,
                        saved: state.savedPlaceIds.contains(place.id),
                        onTap: () => _openDetail(place),
                        onSave: () => state.toggleSaved(place.id),
                        onShare: () => _share(place),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
