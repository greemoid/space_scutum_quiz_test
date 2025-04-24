import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space_scutum_quiz_test/presentation/widgets/main_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(),
                IconButton(onPressed: () {}, icon: Icon(Icons.access_time))
              ],
            ),
            MainButton(
              onTap: () => context.push('/quiz'),
              text: 'Start quiz',
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
