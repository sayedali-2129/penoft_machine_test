import 'package:flutter/material.dart';
import 'package:penoft_machine_test/features/banner/presentation/provider/banner_provider.dart';
import 'package:penoft_machine_test/features/banner/presentation/view/widgets/banner_shimmer.dart';
import 'package:penoft_machine_test/general/widgets/custom_network_image.dart';
import 'package:provider/provider.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BannerProvider>(
      builder: (context, bannerProvider, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: bannerProvider.isLoading && bannerProvider.banner == null
              ? const BannerShimmer()
              : bannerProvider.banner == null
              ? SizedBox.shrink()
              : SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: CNetworkImage(
                    url: bannerProvider.banner ?? '',
                    boxFit: BoxFit.fill,
                  ),
                ),
        );
      },
    );
  }
}
