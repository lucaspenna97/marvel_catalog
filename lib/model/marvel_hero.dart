class MarvelHero {
  int id;
  String name;
  String description;
  String imagePath;
  String imageExtension;

  MarvelHero(
      {this.id,
      this.name,
      this.description,
      this.imagePath,
      this.imageExtension});

  @override
  String toString() {
    return 'Hero{id: $id, name: $name, description: $description, imagePath: $imagePath, imageExtension: $imageExtension}';
  }
}
