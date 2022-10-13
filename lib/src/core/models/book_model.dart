import '../enums/gender_enum.dart';

class BookModel {
  const BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.synopsis,
    required this.gender,
    required this.rate,
    required this.pages,
    required this.totalReadTimes,
    required this.read,
  });

  final int id;
  final String title;
  final String author;
  final String image;
  final String synopsis;
  final Gender gender;
  final double rate;
  final int pages;
  final int totalReadTimes;
  final bool read;
}
