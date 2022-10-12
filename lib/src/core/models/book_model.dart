class BookModel {
  const BookModel({
    required this.title,
    required this.author,
    required this.image,
    required this.synopsis,
    required this.rate,
    required this.pages,
    required this.totalReadTimes,
    required this.read,
  });

  final String title;
  final String author;
  final String image;
  final String synopsis;
  final double rate;
  final int pages;
  final int totalReadTimes;
  final bool read;
}
