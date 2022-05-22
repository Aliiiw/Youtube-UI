import 'package:flutter/material.dart';
import 'package:youtube_sample_ui/entities.dart';
import 'package:youtube_sample_ui/widgets/video_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Image.asset('assets/images/logo.png'),
            ),
            leadingWidth: 120,
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
                  icon: CircleAvatar(
                    backgroundImage: AssetImage(user.profileUrl),
                  )
              )
            ],

          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final video = videos[index];
                  return VideoCard(video: video);
                } ,

              )
          )
        ],

      ),
    );
  }
}
