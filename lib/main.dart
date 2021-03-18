import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/post_api_service.dart';
import 'package:provider/provider.dart';

import 'Homepage.dart';
void main() => runApp(MyRootApp());
// ignore: camel_case_types
class MyRootApp extends StatelessWidget {
  // const post_api_test
  // ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // provider are used to wrap these widgwet to enable the whole
//  widget elemnts to have access and use and mordify  to the rest api
    return Provider(
      // The initialized PostApiService is now available down the widget tree
      create: (_) => PostApiService.create(),
      // Always call dispose on the ChopperClient to release resources
      dispose:  (context, PostApiService service) => service.client.dispose(),
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
