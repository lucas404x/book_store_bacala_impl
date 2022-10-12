import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class BookRate extends StatelessWidget {
  final double rate;

  const BookRate({
    super.key,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow[600],
          size: 14,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: rate.toStringAsFixed(1),
                style: textTheme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.headlineColor,
                  fontSize: 13,
                ),
                children: [
                  TextSpan(
                    text: '/5',
                    style: textTheme.caption?.copyWith(
                      color: AppTheme.textColor,
                      fontSize: 11,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
