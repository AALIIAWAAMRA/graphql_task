import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/foundation.dart';
class GraphQLConfig {
  static final HttpLink httpLink = HttpLink(
    "",
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