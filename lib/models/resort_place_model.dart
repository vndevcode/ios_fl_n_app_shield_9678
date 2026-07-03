class ResortPlaceModel {
  const ResortPlaceModel({
    required this.id,
    required this.title,
    required this.photoIdea,
    required this.shortDescription,
    required this.openingHours,
    required this.location,
    required this.fullDescription,
    required this.highlights,
    required this.imageAsset,
  });

  final String id;
  final String title;
  final String photoIdea;
  final String shortDescription;
  final String openingHours;
  final String location;
  final String fullDescription;
  final List<String> highlights;
  final String imageAsset;
}
