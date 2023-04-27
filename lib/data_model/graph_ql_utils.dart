import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
class GraphAPIUtils {
  final appName = 'Cofinex';
  static const initURL = "https://yxeqaxptabeftfyndq527s76se.appsync-api.us-east-1.amazonaws.com/graphql";


  final HttpLink httpLink = HttpLink(
     'https://api.github.com/graphql',
  );





  GraphQLClient clientToQuery(String token) {

    return GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(
        initURL,

        defaultHeaders: {
      'Authorization': "Bearer "+token
      },
      ),


    );
  }


  Future<dynamic> _query(GraphQLClient client, QueryOptions options) async {
    final result = await client.query(options);

    return result.data;
  }



}
