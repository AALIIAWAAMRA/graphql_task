export const typeDefs = `#graphql
   type Product {
      id : ID!,
      name : String!,
      description : String!,
      price : Float!,
      img_url : String
   }
   type Query {
      getAllProducts : [Product]
      getProductById(id : ID!) : Product
      searchProducts(keyword : String!) : [Product]
   }
`