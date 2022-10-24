import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/data/books.dart';
import '../../core/extensions/extensions.dart';
import '../../core/models/book_model.dart';
import '../../shared/components/book_counter.dart';
import '../../shared/components/book_profile.dart';
import '../../theme/app_theme.dart';

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
  late final BookModel _book;

  @override
  void initState() {
    _book = kBooks.firstWhere((book) => book.id == widget.bookId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: _BookAppBar(title: _book.title),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BookCounter(textAlign: TextAlign.center),
            const SizedBox(height: 16.0),
            Center(
              child: BookProfile(
                image: _book.image,
                width: 120,
                height: 200,
                radius: 8,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Author: ${_book.author}',
              textAlign: TextAlign.center,
              style: textTheme.bodyText1?.copyWith(
                color: AppTheme.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )
            ),
            const SizedBox(height: 8.0),
            Text(
              _book.publishedDate.toExtensiveFormat(),
              textAlign: TextAlign.center,
              style: textTheme.subtitle1?.copyWith(
                color: AppTheme.textColor,
                fontSize: 14,
              )
            )
          ],
        ),
      ),
    );
  }
}

class _BookAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _BookAppBar({
    this.title = '',
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.chevron_back),
              onPressed: () => Navigator.pop(context),
            ),
            Text(
              title,
              style: textTheme.bodyText1?.copyWith(
                color: AppTheme.headlineColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(Icons.more_horiz),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
