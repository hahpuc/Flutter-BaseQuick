import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../shimmer/custom_shimmer_widget.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final bool showPlaceHolder;

  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.showPlaceHolder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder: !showPlaceHolder
          ? null
          : (context, url) => Container(
                alignment: Alignment.center,
                child: const CircleShimmer(
                  radius: 80,
                ),
              ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
