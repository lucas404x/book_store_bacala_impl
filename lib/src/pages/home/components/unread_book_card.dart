import 'package:flutter/material.dart';

import '../../../core/data/books.dart';
import '../../../core/models/book_model.dart';
import '../../../shared/components/book_profile.dart';
import '../../../theme/app_theme.dart';

class UnreadBookCard extends StatelessWidget {
  const UnreadBookCard({super.key});

  @override
  Widget build(BuildContext context) {
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
        children: const [
          _UnreadBookWarningMessage(),
          SizedBox(height: 16.0),
          _UnreadBookInfo()
        ],
      ),
    );
  }
}

class _UnreadBookWarningMessage extends StatelessWidget {
  const _UnreadBookWarningMessage();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
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
                color: AppTheme.textColor,
              ),
              children: [
                TextSpan(
                  text: 'July 30, 2021\n\n',
                  style: textTheme.bodyText1?.copyWith(
                    color: AppTheme.textColor,
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
    );
  }
}

class _UnreadBookInfo extends StatefulWidget {
  const _UnreadBookInfo();

  @override
  State<_UnreadBookInfo> createState() => __UnreadBookInfoState();
}

class __UnreadBookInfoState extends State<_UnreadBookInfo> with TickerProviderStateMixin {
  late final BookModel _book;

  late final AnimationController _controller;
  late final Animation<int> _animation;

  @override
  void initState() {
    _book = kBooks.firstWhere((book) => !book.read);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animation = StepTween(
      begin: 0,
      end: kBooks.where((book) => book.read).length,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BookProfile(
          image: _book.image,
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
                _book.title,
                style: textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) => RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Book ',
                      style: textTheme.bodyText2?.copyWith(
                        color: AppTheme.textColor,
                      ),
                      children: [
                        TextSpan(
                          text: '${_animation.value} ',
                          style: textTheme.bodyText2?.copyWith(
                            color: AppTheme.textColor,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'of ${kBooks.length}',
                              style: textTheme.bodyText2?.copyWith(
                                color: AppTheme.textColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
