class ProductQueries {
  static const String getAllProducts = r'''
    query GetProducts {
      products {
        id
        name
        price
        imageUrl
      }
    }
  ''';

  static const String getProductById = r'''
    query GetProduct($id: ID!) {
      product(id: $id) {
        id
        name
        description
        price
        imageUrl
      }
    }
  ''';

  static const String searchProducts = r'''
    query SearchProducts($keyword: String!) {
      searchProducts(keyword: $keyword) {
        id
        name
        price
        imageUrl
      }
    }
  ''';
}

