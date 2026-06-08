import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/product_model.dart';
import '../queries/product_queries.dart';

class ProductRepository {
  final GraphQLClient client;

  ProductRepository(this.client);

  Future<List<Product>> getProducts() async {
    final result = await client.query(
      QueryOptions(
        document: gql(ProductQueries.getAllProducts),
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List data = result.data?['products'] ?? [];

    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<Product> getProductById(String id) async {
    final result = await client.query(
      QueryOptions(
        document: gql(ProductQueries.getProductById),
        variables: {"id": id},
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    return Product.fromJson(result.data!['product']);
  }

  Future<List<Product>> searchProducts(String keyword) async {
    final result = await client.query(
      QueryOptions(
        document: gql(ProductQueries.searchProducts),
        variables: {"keyword": keyword},
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List data = result.data?['searchProducts'] ?? [];

    return data.map((e) => Product.fromJson(e)).toList();
  }
}