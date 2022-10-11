import 'package:flutter/material.dart';

import 'components/categories_list.dart';
import 'components/presentation_container.dart';

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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: PresentationContainer(),
                ),
                SizedBox(height: 64),
                GendersList()
              ],
            )
          ],
        ),
      ),
    );
  }
}
