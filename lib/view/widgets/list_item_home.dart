import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
          Column(
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
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            '${product.discountValue}%',
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
              RatingBar.builder(
                initialRating: 3.5,
                itemSize: 15,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  debugPrint(rating.toString());
                },
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
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                    ),
                    TextSpan(
                      text:
                          ' ${product.price * (product.discountValue) / 100}\$',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Colors.red,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: size.width * 0.38,
            bottom: 85,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    blurRadius: 6,
                    color: Colors.grey,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20.0,
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.favorite_outline,
                    size: 25.0,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
