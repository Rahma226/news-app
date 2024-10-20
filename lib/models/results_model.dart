class ResultsModel {
  final String? imageUrl; // Make imageUrl nullable
  final String title;
  final String description;

  ResultsModel({
    required this.title,
    required this.description,
    this.imageUrl, // This field is optional and nullable
  });
}
