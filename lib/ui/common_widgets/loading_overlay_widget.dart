import 'package:flutter/material.dart';

class LoadingOverlayWidget {
  LoadingOverlayWidget();

  OverlayEntry? _overlay;

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        builder: (context) => ColoredBox(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
      Overlay.of(context).insert(_overlay!);
    }
  }

  void hide() {
    if (_overlay != null) {
      _overlay?.remove();
      _overlay = null;
    }
  }
}
