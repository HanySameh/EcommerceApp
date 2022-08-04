import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utilities/assets.dart';
import 'package:ecommerce/view/widgets/list_item_home.dart';

import '../../controllers/database_controller.dart';
import '../widgets/header_of_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(
                image: const NetworkImage(
                  AppAssets.topBannerHomePageAsset,
                ),
                width: double.infinity,
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.5,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 24.0),
                child: Text(
                  'Street Clothes',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const BuildHeaderOfList(
                  title: 'Sale',
                  description: 'Super Summer Sale!!',
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  height: 320,
                  child: StreamBuilder<List<Product>>(
                      stream: database.salesProductStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final products = snapshot.data;
                          if (products == null || products.isEmpty) {
                            return const Center(
                              child: Text('No Data Available!'),
                            );
                          }
                          return ListView.builder(
                            itemCount: products.length,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (_, int index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListItemHome(
                                product: products[index],
                              ),
                            ),
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      }),
                ),
                const BuildHeaderOfList(
                  title: 'New',
                  description: 'Super New Products!!',
                ),
                const SizedBox(height: 8.0),
                SizedBox(
                  height: 320,
                  child: StreamBuilder<List<Product>>(
                      stream: database.newProductStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final products = snapshot.data;
                          if (products == null || products.isEmpty) {
                            return const Center(
                              child: Text('No Data Available!'),
                            );
                          }
                          return ListView.builder(
                            itemCount: products.length,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (_, int index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListItemHome(
                                product: products[index],
                              ),
                            ),
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
