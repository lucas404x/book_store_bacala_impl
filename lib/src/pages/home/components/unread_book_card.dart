import 'package:flutter/material.dart';

import '../../../core/data/books.dart';
import '../../../shared/components/book_profile.dart';

class UnreadBookCard extends StatelessWidget {
  const UnreadBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final book = kBooks.first;

    final missingReadBooksCount = kBooks.where((book) => book.read).length;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.black.withOpacity(.06),
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[50]?.withOpacity(.5),
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Remember, Jelly. You have an unfinished book since ',
                    style: textTheme.bodyText1?.copyWith(
                      color: Colors.grey[700],
                    ),
                    children: [
                      TextSpan(
                        text: 'July 30, 2021\n\n',
                        style: textTheme.bodyText1?.copyWith(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  TextSpan(
                    text: 'Continue reading',
                    style: textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange[200],
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BookProfile(
                image: book.image,
                width: 65,
                height: 65,
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 230),
                    child: Text(
                      book.title,
                      style: textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Book ',
                          style: textTheme.bodyText2?.copyWith(
                            color: Colors.grey[600],
                          ),
                          children: [
                            TextSpan(
                              text: '$missingReadBooksCount ',
                              style: textTheme.bodyText2?.copyWith(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: 'of ${kBooks.length}',
                                  style: textTheme.bodyText2?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
