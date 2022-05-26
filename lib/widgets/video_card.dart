import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:youtube_sample_ui/entities.dart';
import 'package:timeago/timeago.dart' as timago;
import 'package:youtube_sample_ui/screens/navigations.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.read(selectedVideo).state = video;

      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(video.url,
                  height: 220, width: double.infinity, fit: BoxFit.cover),
              Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    color: Colors.black,
                    child: Text(
                      video.durationTime,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start ,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => print('profilioooo'),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(video.author.profileUrl),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          video.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            '${video.author.username}'
                            ' - ${video.view} - '
                            '${timago.format(video.releasedTime)}'),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.more_vert,
                      size: 20,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
