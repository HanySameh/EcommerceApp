import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreServices {
  FirestoreServices._();
  static final instance = FirestoreServices._();
  final _fireStore = FirebaseFirestore.instance;

  Future<void> setDate({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final referance = _fireStore.doc(path);
    debugPrint(data.toString());
    await referance.set(data);
  }

  Future<void> deleteData({
    required String path,
  }) async {
    final referance = _fireStore.doc(path);
    debugPrint(path);
    await referance.delete();
  }

  Stream<T> documentsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) {
    final referance = _fireStore.doc(path);
    final snapshots = referance.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _fireStore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) =>
              builder(snapshot.data() as Map<String, dynamic>, snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}
