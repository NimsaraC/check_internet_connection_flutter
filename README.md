# Flutter Internet Connection Checker

This is a simple Flutter application that checks the internet connection status of a mobile device in real-time. It uses the `internet_connection_checker_plus` package to monitor the connection and updates the UI accordingly. The app displays a Wi-Fi icon and a status message ("Connected" or "Disconnected") with appropriate colors (green for connected, red for disconnected).

## Features

- Real-time monitoring of internet connection status.
- Visual feedback with icons and text.
- Lightweight and easy-to-understand implementation.

## Prerequisites

Before running this project, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.0.0 or higher recommended)
- Dart (comes with Flutter)
- An IDE like [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- A physical device or emulator to test the app

## Dependencies

This project uses the following dependency:

- `internet_connection_checker_plus: ^2.7.1`  
  Add it to your `pubspec.yaml` file under `dependencies`:
  ```yaml
  dependencies:
    internet_connection_checker_plus: ^2.7.1
  ```

## Installation

1. Clone this repository to your local machine:
   ```bash
   git clone <repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd flutter-internet-connection-checker
   ```
3. Install the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app on a connected device or emulator:
   ```bash
   flutter run
   ```

## How It Works

The app uses a `StreamSubscription` to listen for changes in the internet connection status via the `InternetConnection().onStatusChange` stream from the `internet_connection_checker_plus` package. The UI updates dynamically based on the connection state.

### Main Code Breakdown

- **Main Entry Point**: The `main.dart` file initializes the app and runs the `MyApp` widget. [See code here](https://github.com/NimsaraC/check_internet_connection_flutter/blob/main/lib/main.dart#L6-L17).
- **SplashScreen Widget**: A stateful widget that handles the connection logic and UI. [See code here](https://github.com/NimsaraC/check_internet_connection_flutter/blob/main/lib/main.dart#L25-L73).
- **Connection Logic**:
  - In `initState()`, a stream subscription listens for connection status changes. [See code here](https://github.com/NimsaraC/check_internet_connection_flutter/blob/main/lib/main.dart#L33-L47).
  - The `isConnected` boolean updates the UI using `setState()`.
  - The subscription is canceled in `dispose()` to prevent memory leaks. [See code here](https://github.com/NimsaraC/check_internet_connection_flutter/blob/main/lib/main.dart#L50-L53).
- **UI**: Displays a Wi-Fi icon and text based on the `isConnected` state. [See code here](https://github.com/NimsaraC/check_internet_connection_flutter/blob/main/lib/main.dart#L57-L73).

## Screenshots

_(Optional: You can add screenshots of the app showing "Connected" and "Disconnected" states here by uploading images to the repo and linking them.)_

## Usage

- Launch the app on your device.
- Turn your Wi-Fi or mobile data on/off to see the status update in real-time.
- The icon and text will change to reflect the current connection state.

## Contributing

Feel free to fork this repository, make improvements, and submit a pull request. Suggestions and bug reports are welcome via the Issues tab.

## License

This project is open-source and available under the [MIT License](LICENSE).
