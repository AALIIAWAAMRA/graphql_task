class ProductQueries {

  static const String getAllProducts = r'''
    query GetAllProducts {
      getAllProducts {
        id
        name
        description
        price
        img_url
      }
    }
  ''';

  static const String getProductById = r'''
    query GetProductById($id: ID!) {
      getProductById(id: $id) {
        id
        name
        description
        price
        img_url
      }
    }
  ''';

  static const String searchProducts = r'''
    query SearchProducts($keyword: String!) {
      searchProducts(keyword: $keyword) {
        id
        name
        description
        price
        img_url
      }
    }
  ''';
}