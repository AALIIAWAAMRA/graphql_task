import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'core/graphql/graphql_client.dart';
import 'presentation/screens/products_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final client = GraphQLConfig.client();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products App',
        home: ProductsScreen(),
      ),
    );
  }
}