class Meta {
  final int page;
  final int size;
  final int totalData;
  final int totalPage;

  Meta(
      {required this.page,
      required this.size,
      required this.totalData,
      required this.totalPage});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
        page: json['page'],
        size: json['size'],
        totalData: json['totalData'],
        totalPage: json['totalPage']);
  }
}
