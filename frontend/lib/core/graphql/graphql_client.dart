import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/foundation.dart';
class GraphQLConfig {
  static final HttpLink httpLink = HttpLink(
    "http://10.0.2.2:4000/graphql",
  );

  static ValueNotifier<GraphQLClient> client() {
    return ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      ),
    );
  }
}