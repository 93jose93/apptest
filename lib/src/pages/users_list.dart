import 'package:flutter/material.dart';
import 'package:testapp/src/widgets/widgets.dart';

import 'package:provider/provider.dart';
import 'package:testapp/src/services/news_service.dart';

class UsersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<NewsService>(context);

   

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('User list'),
          elevation: 0,
        ),
        body:
            //Lista principal
            CardList(results: userProvider.userlines));
  }
}
