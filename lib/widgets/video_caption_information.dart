import 'package:flutter/material.dart';
import 'package:youtube_sample_ui/entities.dart';
import 'package:timeago/timeago.dart' as timago;
import 'package:youtube_sample_ui/screens/navigations.dart';

class VideoCaptionInformation extends StatelessWidget {
  final Video video;

  const VideoCaptionInformation({Key? key, required this.video})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(video.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 16)),
          const SizedBox(
            height: 8,
          ),
          Text(
            '${video.view} views - ${timago.format(video.releasedTime)}',
            style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 14),
          ),
          const Divider(),
          CaptionRow(
            video: video,
          ),
          const Divider(),
          UserInformation(user: video.author,),
          const Divider(),
        ],
      ),
    );
  }
}

class CaptionRow extends StatelessWidget {
  final Video video;

  const CaptionRow({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _CaptionBuild(context, Icons.thumb_up_outlined, video.likes),
        _CaptionBuild(context, Icons.thumb_down_outlined, video.dislikes),
        _CaptionBuild(context, Icons.reply_outlined, 'Share'),
        _CaptionBuild(context, Icons.download_outlined, 'Download'),
        _CaptionBuild(context, Icons.library_add_outlined, 'Save'),
      ],
    );
  }

  Widget _CaptionBuild(BuildContext context, IconData iconData, String label) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData),
          const SizedBox(
            height: 6,
          ),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  final User user;

  const UserInformation({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(user.profileUrl),
          ),
          const SizedBox(
            width: 16,
          )
          ,Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    user.username,
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
                      '${user.subcribers} Subscribers'),
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: (){},
              child: const Text('SUBSCRIBE',
                style: TextStyle(
                    color: Colors.red
                )
                ,)
          )
        ],
      ),
    );
  }
}
