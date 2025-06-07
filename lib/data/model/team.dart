class Team {
  final String name;
  final String imageUrl;
  final bool selected;

  const Team({
    required this.name,
    required this.imageUrl,
    this.selected = false,
  });

  Team copyWith({bool? selected}) {
    return Team(
      name: name,
      imageUrl: imageUrl,
      selected: selected ?? this.selected,
    );
  }
}
