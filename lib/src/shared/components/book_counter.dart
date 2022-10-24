import 'package:flutter/material.dart';

import '../../core/data/books.dart';
import '../../theme/app_theme.dart';

class BookCounter extends StatefulWidget {
  const BookCounter({
    super.key,
    this.textAlign = TextAlign.start,
  });

  final TextAlign textAlign;

  @override
  State<BookCounter> createState() => _BookCounterState();
}

class _BookCounterState extends State<BookCounter> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _animation;

  @override
  void initState() {
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
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => RichText(
        textAlign: widget.textAlign,
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
    );
  }
}
