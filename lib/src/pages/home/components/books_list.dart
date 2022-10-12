import 'package:flutter/material.dart';

import '../../../core/data/books.dart';
import '../../../core/models/book_model.dart';
import '../../../shared/components/book_profile.dart';
import '../../../shared/components/book_rate.dart';
import '../../../theme/app_theme.dart';

class BooksList extends StatefulWidget {
  const BooksList({super.key});

  @override
  State<BooksList> createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 24),
            child: _BookTile(book: kBooks[index]),
          );
        },
        itemCount: kBooks.length,
      ),
    );
  }
}

class _BookTile extends StatelessWidget {
  final BookModel book;

  const _BookTile({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 132,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              BookProfile(
                image: book.image,
                width: 132,
                height: 180,
              ),
              Positioned(
                left: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: BookRate(rate: book.rate),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            book.title,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyText1?.copyWith(
              color: AppTheme.headlineColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Text(
            book.author,
            style: textTheme.caption?.copyWith(
              color: AppTheme.textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
