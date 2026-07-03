import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GuestServiceModel {
  const GuestServiceModel({
    required this.id,
    required this.title,
    required this.iconIdea,
    required this.icon,
    required this.status,
    required this.shortDescription,
    required this.requestButtonLabel,
    required this.requestNote,
  });

  final String id;
  final String title;
  final String iconIdea;
  final FaIconData icon;
  final String status;
  final String shortDescription;
  final String requestButtonLabel;
  final String requestNote;
}
