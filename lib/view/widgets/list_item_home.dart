import 'package:ecommerce/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:ecommerce/models/product_model.dart';

import 'love_button.dart';

class ListItemHome extends StatelessWidget {
  final Product product;
  const ListItemHome({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context, rootNavigator: true).pushNamed(
                AppRoutes.productDetailsRoute,
                arguments: product,
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        product.imgUrl,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 50,
                        height: 25,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: product.discountValue != 0
                                ? Colors.red
                                : Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              product.discountValue != 0
                                  ? '${product.discountValue}%'
                                  : 'New',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: Colors.white,
                                      ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    RatingBarIndicator(
                      itemSize: 15,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      rating: 3.5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                    Text(
                      '(100)',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  product.category,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  product.title,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 6.0),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${product.price}\$',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              color: product.discountValue == 0
                                  ? Colors.black
                                  : Colors.grey,
                              decoration: product.discountValue == 0
                                  ? TextDecoration.none
                                  : TextDecoration.lineThrough,
                            ),
                      ),
                      if (product.discountValue != 0)
                        TextSpan(
                          text:
                              ' ${product.price * (product.discountValue) / 100}\$',
                          style:
                              Theme.of(context).textTheme.subtitle2!.copyWith(
                                    color: Colors.red,
                                  ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: size.width * 0.38,
            bottom: 85,
            child: const LoveButton(),
          ),
        ],
      ),
    );
  }
}
