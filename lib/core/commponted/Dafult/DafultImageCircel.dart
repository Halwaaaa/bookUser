import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DafultImageCircle extends StatelessWidget {
  const DafultImageCircle({super.key, required this.url, required this.raduis});
  final String url;
  final double raduis;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageBuilder: (context, imageProvider) => CircleAvatar(
          onBackgroundImageError: (exception, stackTrace) {},
          backgroundImage: imageProvider,
          radius: raduis),
    );
  }
}
