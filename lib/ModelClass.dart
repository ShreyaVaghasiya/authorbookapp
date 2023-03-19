class AuthorData {
  String? book;
  String? name;

  AuthorData({required this.book, required this.name });

  AuthorData.fromMap(Map<String, dynamic> map) {
    book = map[book];
    name = map[name];
  }

  Map<String, dynamic> toMap() => {
    'book': book,
    'name': name,
  };
}
