import 'package:ecommerce/services/firestore_services.dart';

import '../models/product_model.dart';

abstract class Database {
  Stream<List<Product>> salesProductStream();
  Stream<List<Product>> newProductStream();
}

class FireStorDatabase implements Database {
  final String uId;
  final _service = FirestoreServices.instance;

  FireStorDatabase(this.uId);
  @override
  Stream<List<Product>> salesProductStream() => _service.collectionsStream(
        path: 'product/',
        builder: (data, documentId) => Product.fromJson(data!, documentId),
        queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0),
      );

  @override
  Stream<List<Product>> newProductStream() => _service.collectionsStream(
        path: 'product/',
        builder: (data, documentId) => Product.fromJson(data!, documentId),
      );
}
