import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

Future<void> showAssetImageViewer(
  BuildContext context, {
  required String assetPath,
}) async {
  await showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close',
    barrierColor: Colors.black.withOpacity(0.85),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, animation, secondaryAnimation) {
      return SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: PhotoView(
                imageProvider: AssetImage(assetPath),
                backgroundDecoration:
                    const BoxDecoration(color: Colors.transparent),
                minScale: PhotoViewComputedScale.contained,
                heroAttributes: PhotoViewHeroAttributes(tag: assetPath),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: IconButton.filled(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.close_rounded),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
