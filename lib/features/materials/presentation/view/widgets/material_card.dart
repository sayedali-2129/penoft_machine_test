import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:penoft_machine_test/features/cart/presentation/provider/cart_provider.dart';
import 'package:penoft_machine_test/features/materials/data/material_model.dart';
import 'package:penoft_machine_test/general/utils/app_colors.dart';
import 'package:penoft_machine_test/general/widgets/custom_network_image.dart';
import 'package:provider/provider.dart';

class MaterialCard extends StatelessWidget {
  const MaterialCard({super.key, required this.material});
  final MaterialModel material;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 144,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: CNetworkImage(url: material.image!, boxFit: BoxFit.fill),
            ),
            Gap(12),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    material.title ?? '',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'by ${material.brand ?? ''}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Consumer<CartProvider>(
                        builder: (context, cartState, _) {
                          final cartItem = cartState.cart.firstWhere(
                            (element) => element.title == material.title,
                            orElse: () => material,
                          );
                          final isInCart = cartState.cart.any(
                            (element) => element.title == material.title,
                          );
                          return !isInCart
                              ? InkWell(
                                  onTap: () {
                                    cartState.addToCart(material);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.2,
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'Add',
                                      style: TextStyle(color: AppColors.black),
                                    ),
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withValues(
                                      alpha: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          cartState.decrementQty(material);
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          size: 16,
                                          color: AppColors.white,
                                        ),
                                      ),

                                      Gap(10),
                                      Text(
                                        '${cartItem.qty ?? 0}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Gap(10),
                                      InkWell(
                                        onTap: () {
                                          cartState.incrementQty(material);
                                        },
                                        child: Icon(
                                          Icons.add,
                                          size: 16,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Divider(
                      color: AppColors.neutral.withValues(alpha: 0.5),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: material.price!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' ${material.originalPrice!}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.neutral500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Gap(4),
                          Text(
                            '${material.rating!} (${material.reviews!})',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gap(8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      material.tag!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
