import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_sample_ui/entities.dart';
import 'package:youtube_sample_ui/screens/navigations.dart';
import 'package:youtube_sample_ui/widgets/video_caption_information.dart';
import 'package:youtube_sample_ui/widgets/video_card.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}


class _VideoScreenState extends State<VideoScreen> {
  ScrollController ? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme
            .of(context)
            .scaffoldBackgroundColor,
        child: CustomScrollView(
          controller: _scrollController,
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context, watch, _) {
                  final selectVideo = watch(selectedVideo).state;
                  return SafeArea(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              selectVideo!.url,
                              height: 220,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                                onPressed: () =>
                                    context
                                        .read(miniPlayerController)
                                        .state
                                        .animateToHeight(state: PanelState.MIN),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 35,
                                ))
                          ],
                        ),
                        const LinearProgressIndicator(
                          value: 0.5,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                        VideoCaptionInformation(video: selectVideo),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final video = suggestionVideos[index];
                  return VideoCard(
                    video: video,
                    hasPadding: true,
                    isTapped: () =>
                        _scrollController!.animateTo(0,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeIn),
                  );
                }, childCount: suggestionVideos.length))
          ],
        ),
      ),
    );
  }
}

