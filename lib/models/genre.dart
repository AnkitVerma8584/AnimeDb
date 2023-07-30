class Genre {
  final String id, name;

  const Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json['_id'], name: json['_id']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Genre{id: $id, name: $name}';
  }
}
