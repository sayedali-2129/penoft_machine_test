import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CNetworkImage extends StatelessWidget {
  const CNetworkImage({
    super.key,
    required this.url,
    this.showIcon = false,
    this.boxFit,
    this.height,
    this.width,
    this.fallbackIcon,
  });

  final String url;
  final bool showIcon;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final IconData? fallbackIcon;

  String _normalizeUrl(String url) {
    if (url.isEmpty) return url;

    final uri = Uri.parse(url);
    final pathWithoutQuery = uri.path;

    final hasExtension =
        pathWithoutQuery.contains('.') &&
        pathWithoutQuery.split('.').last.length <= 5 &&
        !pathWithoutQuery.endsWith('.');

    if (!hasExtension) {
      final normalizedPath = '$pathWithoutQuery.png';
      final normalizedUri = uri.replace(path: normalizedPath);
      return normalizedUri.toString();
    }

    return url;
  }

  @override
  Widget build(BuildContext context) {
    final normalizedUrl = _normalizeUrl(url);

    return CachedNetworkImage(
      imageUrl: normalizedUrl,
      height: height,
      width: width,
      fit: boxFit ?? BoxFit.cover,
      httpHeaders: {"Accept": "image/*"},
      filterQuality: FilterQuality.high,
      cacheManager: null, // Use default cache manager
      placeholder: (context, url) => Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        baseColor: AppColors.primary.withOpacity(0.1),
        highlightColor: AppColors.primary,
        child: Container(color: AppColors.primary.withOpacity(0.2)),
      ),
      errorWidget: (context, url, error) {
        // Log the error for debugging
        debugPrint('Failed to load image: $url, Error: $error');

        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            fallbackIcon ??
                (showIcon ? Icons.person_outline : Icons.image_not_supported),
            size: (height != null && height! < 40) ? height! * 0.6 : 40,
            color: AppColors.primary.withOpacity(0.6),
          ),
        );
      },
    );
  }
}
