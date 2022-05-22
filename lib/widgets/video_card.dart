import 'package:flutter/material.dart';
import 'package:youtube_sample_ui/entities.dart';
import 'package:timeago/timeago.dart' as timago;

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              video.url,
              height: 220,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  color: Colors.black54,
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
        Row(
          children: [
            GestureDetector(
              onTap: () => print('profilioooo'),
              child: CircleAvatar(
                foregroundImage: NetworkImage(video.author.profileUrl),
              ),
            ),
            SizedBox(width: 8,),
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
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          '${video.author.username}'
                          ' - ${video.view} - '
                          '${timago.format(video.releasedTime)}')),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
