import 'package:currency_tracker/views/home_view/components/home_body.dart';
import 'package:flutter/material.dart';

import 'components/popupEntiry.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text("Dictionary"),
          IconButton(
              onPressed: () {
                showDialog(context: context, builder: PopUpEntiryForm);
              },
              icon: const Icon(Icons.search))
        ]),
      ),
      body: const HomeBody(),
    );
  }
}
