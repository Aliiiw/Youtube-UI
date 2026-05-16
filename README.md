# YouTube UI

A Flutter implementation of a simple YouTube-style mobile interface. The project focuses on recreating the main browsing and video playback experience with local sample data, local image assets, Riverpod state management, and a mini-player interaction.

This is a UI practice project. It does not connect to a backend, database, authentication service, or the real YouTube API.

## Features

- Dark YouTube-inspired app theme
- Portrait-only app orientation
- Home feed built with `CustomScrollView`, `SliverAppBar`, and `SliverList`
- YouTube logo asset in the app bar
- App bar actions for cast, notifications, search, and profile avatar
- Reusable video card widget with:
  - thumbnail image
  - duration badge
  - channel avatar
  - title
  - author, view count, and relative publish time
  - overflow menu icon
- Bottom navigation with five tabs:
  - Home
  - Explore
  - Add
  - Subscriptions
  - Library
- Riverpod state for the selected video and mini-player controller
- Expandable video screen using `miniplayer`
- Collapsed mini-player with thumbnail, title, channel name, play button, close button, and progress bar
- Expanded video view with:
  - video image
  - progress bar
  - title and metadata
  - like/dislike/share/download/save action row
  - channel information and subscribe button
  - suggested videos list
- Local sample users and videos in `entities.dart`

## Tech Stack

- Flutter
- Dart
- Riverpod: `flutter_riverpod`
- Mini player: `miniplayer`
- Relative dates: `timeago`
- Material widgets
- Local image assets

## Project Structure

```text
.
+-- lib/
|   +-- main.dart                         # App entry point and theme setup
|   +-- entities.dart                     # Sample User and Video models/data
|   +-- screens/
|       +-- navigations.dart              # Bottom navigation and mini-player shell
|       +-- home_screen.dart              # Home feed and app bar
|       +-- expand_video_screen.dart      # Expanded video player screen
|   +-- widgets/
|       +-- video_card.dart               # Reusable feed/suggestion video card
|       +-- video_caption_information.dart # Video metadata, actions, and channel row
+-- assets/
|   +-- images/                           # Logo, thumbnails, and profile image
+-- android/
+-- ios/
+-- pubspec.yaml
```

## Main Screens

### Home

The home screen displays a YouTube-like top app bar and a vertical feed of sample videos. Tapping a video sets it as the selected video and opens the mini-player in expanded mode.

### Mini Player

The mini-player is controlled through Riverpod state and the `miniplayer` package. It can show a collapsed row at the bottom of the screen or expand into the full video screen.

### Expanded Video

The expanded video screen shows the selected video's thumbnail as the player area, video metadata, action buttons, author information, a subscribe button, and suggested videos.

### Placeholder Tabs

Explore, Add, Subscriptions, and Library are currently placeholder screens with centered text.

## Getting Started

Install Flutter, then clone the project and fetch dependencies:

```bash
git clone https://github.com/Aliiiw/Youtube-UI.git
cd Youtube-UI
flutter pub get
```

Run the app:

```bash
flutter run
```

The project currently targets Flutter SDK `>=2.17.0 <3.0.0`.

## Assets

Image assets are loaded from:

```text
assets/images/
```

The folder contains the YouTube logo image plus sample thumbnail/profile images used by the feed and video pages. The folder is registered in `pubspec.yaml`.

## Notes

- This is a static UI clone and does not play real video.
- Video thumbnails, titles, authors, likes, and suggestions are hard-coded sample data.
- The project uses older package versions, including `flutter_riverpod: ^0.13.1+1`.
- The repository currently includes generated `build/` artifacts; those files are not needed for normal source-based development.
- Some model/property names keep their original spelling from the project, such as `subcribers`.

## Possible Improvements

- Remove generated build artifacts from version control
- Add screenshots or GIFs to this README
- Replace placeholder tabs with real Explore, Add, Subscriptions, and Library UIs
- Add a data layer or mocked API service for videos and channels
- Update Riverpod usage to the current API
- Add responsive layouts for tablet and landscape modes
- Extract repeated video action widgets into smaller components
- Add tests for model data and key widgets
