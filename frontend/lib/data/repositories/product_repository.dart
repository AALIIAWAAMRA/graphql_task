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
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List data = result.data?['getAllProducts'] ?? [];

    return data
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }


  Future<Product> getProductById(String id) async {
    final result = await client.query(
      QueryOptions(
        document: gql(ProductQueries.getProductById),
        variables: {"id": id},
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final data = result.data?['getProductById'];

    if (data == null) {
      throw Exception("Product not found");
    }

    return Product.fromJson(data as Map<String, dynamic>);
  }


  Future<List<Product>> searchProducts(String keyword) async {
    final result = await client.query(
      QueryOptions(
        document: gql(ProductQueries.searchProducts),
        variables: {"keyword": keyword},
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );

    if (result.hasException) {
      throw Exception(result.exception.toString());
    }

    final List data = result.data?['searchProducts'] ?? [];

    return data
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}