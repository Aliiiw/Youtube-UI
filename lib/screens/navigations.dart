import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_sample_ui/entities.dart';
import 'home_screen.dart';
import 'package:timeago/timeago.dart' as timago;

final selectedVideo = StateProvider<Video?>((ref) => null);

class NavigateScreen extends StatefulWidget {
  const NavigateScreen({Key? key}) : super(key: key);

  @override
  State<NavigateScreen> createState() => _NavigateScreenState();
}

class _NavigateScreenState extends State<NavigateScreen> {
  int _currentIndex = 0;
  static const double _playerHeight = 60;

  final screens = [
    const HomeScreen(),
    const Scaffold(
      body: Center(
        child: Text('Explore'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Add'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Sub'),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Library'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, _) {
          final _selectedVideo = watch(selectedVideo).state;
          return Stack(
            children: screens
                .asMap()
                .map((i, screen) => MapEntry(
                      i,
                      Offstage(
                        offstage: _currentIndex != i,
                        child: screen,
                      ),
                    ))
                .values
                .toList()
              ..add(
                Offstage(
                  offstage: _selectedVideo == null,
                  child: Miniplayer(
                      maxHeight: MediaQuery.of(context).size.height,
                      minHeight: _playerHeight,
                      builder: (height, percentage) {
                        if (_selectedVideo == null) {
                          return const SizedBox.shrink();
                        }
                        return Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      _selectedVideo.url,
                                      height: _playerHeight - 4,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              _selectedVideo.title,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .caption!
                                                  .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .copyWith(fontSize: 12),
                                                overflow: TextOverflow.ellipsis,
                                                _selectedVideo.author.username),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: (){}
                                        , icon: const Icon(Icons.play_arrow)),
                                    IconButton(
                                        onPressed: (){
                                          context
                                          .read(selectedVideo)
                                              .state = null;
                                        }
                                        , icon: const Icon(Icons.close)),
                                  ],
                                ),
                                const LinearProgressIndicator(
                                  value: 0.4,
                                  valueColor:
                                      AlwaysStoppedAnimation<Color>(Colors.red),
                                )
                              ],
                            ));
                      }),
                ),
              ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (_index) => setState(() => _currentIndex = _index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: 'Explore',
              activeIcon: Icon(Icons.explore)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Add',
              activeIcon: Icon(Icons.add_circle)),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              label: 'Subscriptions',
              activeIcon: Icon(Icons.video_library_outlined)),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library),
              label: 'Library',
              activeIcon: Icon(Icons.home)),
        ],
      ),
    );
  }
}
