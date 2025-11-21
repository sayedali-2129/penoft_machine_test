import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/cart/presentation/provider/cart_provider.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/widgets/custom_button.dart';
import 'package:penoft_machine_test/general/widgets/custom_network_image.dart';
import 'package:provider/provider.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, _) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Your cart details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
              Gap(12),
              if (cartProvider.cart.isEmpty)
                Text(
                  'Your cart is empty!',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                )
              else
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Gap(12),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: CNetworkImage(
                                url: cartProvider.cart[index].image ?? '',
                                boxFit: BoxFit.cover,
                              ),
                            ),
                            Gap(12),
                            Flexible(
                              child: Text(
                                cartProvider.cart[index].title ?? '',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  itemCount: cartProvider.cart.length,
                ),
              if (cartProvider.cart.isNotEmpty) ...[
                Gap(20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.buttonGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${cartProvider.getTotalItems()} Item | \$${cartProvider.getTotalAmount().toStringAsFixed(2)}',
                        style: TextStyle(color: AppColors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Gap(30),
                Row(
                  children: [
                    Expanded(
                      child: CustomOutlineButton(
                        buttonHeight: 50,
                        buttonColor: Colors.transparent,
                        borderColor: AppColors.primary,
                        borderRadius: 10,
                        buttonWidget: Text(
                          'Close',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Gap(12),
                    Expanded(
                      child: CustomGradientButton(
                        buttonHeight: 50,
                        borderRadius: 10,
                        buttonColors: [Color(0x809B4AE8), Color(0xFF8932EB)],
                        buttonWidget: Text(
                          'Checkout',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ] else ...[
                Gap(30),
                CustomOutlineButton(
                  buttonHeight: 50,
                  buttonWidth: double.infinity,
                  buttonColor: Colors.transparent,
                  borderColor: AppColors.primary,
                  borderRadius: 10,
                  buttonWidget: Text(
                    'Close',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
