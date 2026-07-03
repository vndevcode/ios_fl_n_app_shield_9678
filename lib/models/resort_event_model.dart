import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum EventStatus {
  upcoming,
  today,
}

class ResortEventModel {
  const ResortEventModel({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.status,
    required this.shortDescription,
    required this.fullDescription,
    required this.guestNotes,
    required this.requestButtonLabel,
    this.imageAsset,
    this.icon,
  }) : assert(
          imageAsset != null || icon != null,
          'Event must have either an image asset or an icon.',
        );

  final String id;
  final String title;
  final String date;
  final String time;
  final String location;
  final EventStatus status;
  final String shortDescription;
  final String fullDescription;
  final String guestNotes;
  final String requestButtonLabel;
  final String? imageAsset;
  final FaIconData? icon;

  bool get isToday => status == EventStatus.today;
  bool get hasImageAsset => imageAsset != null;
}
