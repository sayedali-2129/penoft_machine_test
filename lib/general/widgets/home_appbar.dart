import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/cart/presentation/provider/cart_provider.dart';
import 'package:penoft_machine_test/features/cart/presentation/view/cart_bottom_sheet.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/utils/app_icons.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.isLabelVisible, this.title});
  final bool isLabelVisible;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      surfaceTintColor: AppColors.white,
      leadingWidth: 60,
      centerTitle: false,
      title: title,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      leading: isLabelVisible ? Icon(Icons.menu, size: 28) : null,
      actionsPadding: EdgeInsets.only(right: 16),
      actions: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.neutral),
            shape: BoxShape.circle,
          ),
          child: Image.asset(AppIcons.notificationIcon, scale: 4),
        ),
        Gap(10),
        Consumer<CartProvider>(
          builder: (context, cartState, _) {
            return Badge(
              offset: Offset(1, -1),
              isLabelVisible: cartState.cart.isNotEmpty,
              backgroundColor: AppColors.primary,
              label: Text(cartState.cart.length.toString()),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => CartBottomSheet(),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: cartState.cart.isNotEmpty
                          ? AppColors.primary
                          : AppColors.neutral,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(AppIcons.cartIcon, scale: 4),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
