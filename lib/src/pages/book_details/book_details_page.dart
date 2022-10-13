import 'package:flutter/material.dart';

class BookDetailsPage extends StatefulWidget {
  final int bookId;

  const BookDetailsPage({
    super.key,
    required this.bookId,
  });

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('${widget.bookId}'),
    );
  }
}
