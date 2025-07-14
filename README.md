Developed by [Ayeshaa-Aslam](https://github.com/Ayeshaa-Aslam)

Flutter Pexels Image Gallery App
A Flutter application that displays curated images from the [Pexels API](https://www.pexels.com/api/) in a responsive grid layout. Users can load more images with pagination and view them in higher resolution.

Features
1. Fetches curated images from the Pexels API.
2. Displays images in a responsive 3-column grid
3. Tap on any image to open it in a new screen (with full resolution)
4. Load more images with a single tap
5. Set image as a wallpaper

Requirements
1. Flutter SDK
2. Dart SDK (comes with Flutter)
3. Android Studio or Visual Studio Code (for debugging & running)
4. A valid **Pexels API Key**

Pexels API Key Setup
1. Go to [https://www.pexels.com/api/](https://www.pexels.com/api/) and sign up or log in.
2. Generate your API key.
3. In the Flutter project, open `pexels.dart`.
4. Replace the value in this line:
   ```dart
   headers: {
     'Authorization': 'YOUR_API_KEY_HERE'
   }

Follow these steps to run the app locally
1. git clone https://github.com/Ayeshaa-Aslam/Flutter-Pexels-Image-Gallery-App
2. cd pexels_flutter_app
3. Install Dependencies
   flutter pub get
   flutter run
4. You can use a physical device or emulator.

