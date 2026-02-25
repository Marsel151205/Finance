import 'package:flutter/material.dart';

class LoadingOverlay {
  static OverlayEntry? _overlay;

  static void show(BuildContext context) {
    if (_overlay != null) return;

    _overlay = OverlayEntry(
      builder: (context) => Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Color(0xFF4dff4d),
                ),
                SizedBox(height: 16),
                Text(
                  'Загрузка...',
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.none,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlay!);
  }

  static void hide() {
    _overlay?.remove();
    _overlay = null;
  }
}