import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
class GraphAPIUtils {
  final appName = 'Cofinex';
  static const initURL = "https://yxeqaxptabeftfyndq527s76se.appsync-api.us-east-1.amazonaws.com/graphql";
  static const secondURL = "https://sy7c3na66zexteenmkbksb6dc4.appsync-api.us-east-1.amazonaws.com/graphql";


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


  GraphQLClient clientSecondToQuery(String token) {

    return GraphQLClient(
      cache: GraphQLCache(),
      link: HttpLink(
        secondURL,

        defaultHeaders: {
          'Authorization': "Bearer "+token
        },
      ),


    );
  }




}
