# story_view [![Pub](https://img.shields.io/pub/v/story_view.svg)](https://pub.dev/packages/story_view)

How to modify an existing pub package to use in your flutter project

Why do you always rely on somebody else’s pub packages? You can add your creativity to any package.


You can not make changes to the original package. You have to fork that particular repository.

Perform the following steps to modify an existing package:

Step 1: Find the pub package you want to modify.

Step 2: Go to the git repository of that package.

Step 3: Fork Repository (you need to log in with your git account on Github).

On clicking the fork button, it will create a repository in your GitHub account.
Clone your repository and make your changes into the package.
Step 4: Commit and Push your changes to your forked repository.

Step 5: Refresh your forked repository and you’ll find your latest commit there.

if you don’t find your commits in the forked repository then please verify the git user.
How to add this modified package into your flutter project?


Add flutter dependency into your pubspec.yaml file as below:
dependencies:
  flutter:
    sdk: flutter

  [package-name]:
    git:
      url: https://github.com/[git-username]/[git-repository-name]
If you think your changes in the package are helpful to others then submit a pull request to the original author of the library. The author will identify your commit and if they find it fruitful then they will merge it into the main repository.

If your pull request gets accepted then you can use the main package with the updated version.

Disclaimer: After performing the above steps you are using packages from your repository. So, if the owner of the original package gives an update then you will not receive those updates.😊

That’s all for this particular post. I hope I was able to explain how we can apply modification in an existing package and use it in your Flutter project.

Feel Free to post your comments if you face any issues. You can 👏 if you liked the article. Do you know that you can 👏 50 times in a single post? try it.

Thanks for reading…!!!

Story view for apps with stories.

<p float="left">
  
  <img src="https://i.ibb.co/Q8Wtw62/Screenshot-1584263003.png" width=400 />
  <img src="https://i.ibb.co/bz0R9bd/Screenshot-1584263008.png" width=400 />
  <img src="https://i.ibb.co/NrLSbZv/Screenshot-1584263018.png" width=400 />
</p>

👨‍🚀 Demo project here: [storyexample](https://github.com/blackmann/storyexample.git)

🍟 Watch video demo here: [story_view demo](https://youtu.be/yHAVCsWEKQE)
[![Youtube](https://img.youtube.com/vi/yHAVCsWEKQE/maxresdefault.jpg)](https://youtu.be/yHAVCsWEKQE)

This a Flutter widget to display stories just like Whatsapp and Instagram. Can also be used
inline/inside ListView or Column just like Google News app. Comes with gestures
to pause, forward and go to previous page.

# Features

🕹 Still image, GIF and video support (with caching enabled)

📍 Gesture for pause, rewind and forward

⚜️ Caption for each story item

🎈 Animated progress indicator for each story item

And useful callback to perform meta functionalities including vertical swipe gestures.

# Installation

To use this plugin, add `story_view` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

# Usage

Import the package into your code

```dart
import "package:story_view/story_view.dart";
```

Look inside `examples/example.dart` on how to use this library. You can copy
and paste the code into your `main.dart` and run to have a quick look.

## Basics

Use [`StoryView`](https://pub.dev/documentation/story_view/latest/story_view/StoryView-class.html) to add stories to screen or view heirarchy. `StoryView` requires a list of [`StoryItem`](https://pub.dev/documentation/story_view/latest/story_view/StoryItem-class.html), each of which describes the view to be displayed on each story page, duration and so forth. This gives you the freedom to customize each page of the story.

There are shorthands provided to create common pages.

`StoryItem.text` is a shorthand to create a story page that displays only text.

`StoryItem.pageImage` creates a story item to display images with a caption.

`StoryItem.inlineImage` creates a story item that is intended to be displayed in a linear view hierarchy like `List`
or `Column`

> 🍭 Both `.inlineImage` and `pageImage` support animated GIFs.

`StoryItem.pageVideo` creates a page story item with video media. Just provide your video url and get going.

### Story controller, loaders and GIF support

While images load, it'll be a better experience to pause the stories until it's done. To achieve this effect, create a global instance of [`StoryController`](https://pub.dev/documentation/story_view/latest/story_controller/StoryController-class.html) and use the shorthand `StoryItem.pageImage` or `StoryItem.inlineImage` while passing the same controller instance to it.

```dart
...
final controller = StoryController();

@override
Widget build(context) {
  List<StoryItem> storyItems = [
    StoryItem.text(...),
    StoryItem.pageImage(...),
    StoryItem.pageImage(...),
    StoryItem.pageVideo(
      ...,
      controller: controller,
    )
  ]; // your list of stories

  return StoryView(
    storyItems,
    controller: controller, // pass controller here too
    repeat: true, // should the stories be slid forever
    onStoryShow: (s) {notifyServer(s)},
    onComplete: () {},
    onVerticalSwipeComplete: (direction) {
      if (direction == Direction.down) {
        Navigator.pop(context);
      }
    } // To disable vertical swipe gestures, ignore this parameter.
      // Preferrably for inline story view.
  )
}
```

🍭 Now, tell your users some stories.


