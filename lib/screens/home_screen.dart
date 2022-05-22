import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Image.asset('assets/images/logo.png'),
            ),
            leadingWidth: 140,
            actions: [
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.cast)
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.notifications_outlined)
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.search)
              ),
              IconButton(
                  onPressed: (){},
                  icon: const CircleAvatar(
                  )
              )
            ],

          )
        ],

      ),
    );
  }
}
