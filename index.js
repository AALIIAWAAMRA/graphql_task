import { ApolloServer } from "@apollo/server";
import { startStandaloneServer } from "@apollo/server/standalone";

import {typeDefs} from "./schema.js";
import { products } from "./_db.js";

const PORT = 4000;

const resolvers = {
   Query: {
      getAllProducts: () => {
         return products;
      },
      getProductById: (id) => {
         return products.find(product => product.id === id);
      },
      searchProducts: (keyword) => {
         return products.filter(product =>
            product.name.toLowerCase().includes(keyword.toLowerCase()) ||
            product.description.toLowerCase().includes(keyword.toLowerCase())
         );
      }
   }
}

const server = new ApolloServer({
   typeDefs,
   resolvers
});

const { url } = await startStandaloneServer(server, {
  listen: { port: PORT },
});

console.log(`Server ready at ${url} and port ${PORT}` );