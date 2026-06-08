import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../data/models/product_model.dart';
import '../../data/repositories/product_repository.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;

  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends State<ProductDetailsScreen> {
  Product? product;
  bool isLoading = true;
  String error = '';

  late ProductRepository repository;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final client = GraphQLProvider.of(context).value;
    repository = ProductRepository(client);

    loadProduct();
  }

  Future<void> loadProduct() async {
    try {
      final data =
      await repository.getProductById(widget.productId);

      setState(() {
        product = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (error.isNotEmpty) {
      return Scaffold(
        body: Center(child: Text(error)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product!.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(product!.imageUrl),
            const SizedBox(height: 10),
            Text(
              product!.name,
              style: const TextStyle(fontSize: 22),
            ),
            Text(product!.description),
            Text("${product!.price} \$"),
          ],
        ),
      ),
    );
  }
}