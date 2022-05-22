class User{
  final String username;
  final String profileUrl;
  final String subcribers;

  const User({
    required this.username,
    required this.profileUrl,
    required this.subcribers,
  });

}

User user = const User(
    username: 'Ali Rahimi',
    profileUrl: 'assets/images/sp1',
    subcribers: '123');

class Video{
  final String id;
  final User author;
  final String title;
  final String url;
  final String durationTime;
  final DateTime releasedTime;
  final String view;
  final String likes;
  final String dislikes;

  Video({
    required this.id,
    required this.author,
    required this.title,
    required this.url,
    required this.durationTime,
    required this.releasedTime,
    required this.view,
    required this.likes,
    required this.dislikes});

}

final List<Video> videos = [
  Video(
      id: 'qwerrtyyu',
      author: user,
      title: 'Learning Flutter in 3 Hours',
      url: 'assets/images/sp2.jpeg',
      durationTime: '43:45',
      releasedTime: DateTime(2022, 7,14),
      view: '14k',
      likes: '3453',
      dislikes: '23'),
  Video(
      id: 'zxcbndfgf',
      author: user,
      title: 'How to become Mobile App Developer in 2022',
      url: 'assets/images/sp3.jpeg',
      durationTime: '1:34:34',
      releasedTime: DateTime(2021,6,9),
      view: '67k',
      likes: '5436',
      dislikes: '78'),
  Video(
      id: 'ioiyoyukrf',
      author: user,
      title: 'Try to Escape from Life',
      url: 'assets/images/sp4.jpeg',
      durationTime: '28:23',
      releasedTime: DateTime(2021,3,7),
      view: '343k',
      likes: '555',
      dislikes: '44'),
];

final List<Video> suggestionVideos = [
  Video(
      id: 'tgmrsfdgnlf',
      author: user,
      title: 'Learning Kotlin in 3 Hours',
      url: 'assets/images/sp2.jpeg',
      durationTime: '47:45',
      releasedTime: DateTime(2022, 9,5),
      view: '16k',
      likes: '34',
      dislikes: '2'),
  Video(
      id: 'nyetymnte;',
      author: user,
      title: 'How to become iOS Developer in 2022',
      url: 'assets/images/sp1.jpeg',
      durationTime: '14:14',
      releasedTime: DateTime(2021,9,6),
      view: '88k',
      likes: '36',
      dislikes: '8'),
  Video(
      id: 'gfhfhgdhsad',
      author: user,
      title: 'Try to Learn ObjectBox',
      url: 'assets/images/sp1.jpeg',
      durationTime: '23:23',
      releasedTime: DateTime(2020,3,7),
      view: '33k',
      likes: '55',
      dislikes: '4'),
];