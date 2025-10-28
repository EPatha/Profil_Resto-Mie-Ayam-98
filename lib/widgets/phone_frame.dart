import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A simple decorative phone frame used only on web builds.
///
/// Wrap your app's page with this widget. On web it centers the child in a
/// rounded rectangle that resembles a phone (not a simulator). On other
/// platforms it simply returns the child unchanged.
class PhoneFrame extends StatelessWidget {
  final Widget child;
  const PhoneFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Only show the frame when running on web (Chrome). On mobile/desktop
    // return the child directly so the app can use the full screen.
    if (!kIsWeb) return child;

    // Phone frame size (approx iPhone 12/13/14 mini/regular sizes) — adjust
    // to taste. We'll use a fixed aspect ratio and max width to keep it
    // readable in desktop browsers.
    const double frameWidth = 390; // logical pixels
    const double frameHeight = 844;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            width: frameWidth,
            height: frameHeight,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(34),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Material(
                  color: Colors.white,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
