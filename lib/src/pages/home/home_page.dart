import 'package:flutter/material.dart';

import '../../core/helpers/scroll_behavior_without_glow.dart';
import 'components/genders_list.dart';
import 'components/presentation_container.dart';
import 'components/unread_book_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollBehaviorWithoutGlow(),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: PresentationContainer(),
                    ),
                    SizedBox(height: 148),
                    GendersList(),
                    SizedBox(height: 16.0),

                  ],
                ),
                Positioned(
                  left: 24,
                  top: 150,
                  width: MediaQuery.of(context).size.width * .88,
                  child: const UnreadBookCard(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
