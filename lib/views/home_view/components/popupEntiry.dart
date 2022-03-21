import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/search_bloc.dart';

Widget PopUpEntiryForm(BuildContext context) {
  String entiryWord = "";
  return AlertDialog(
    content: Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
            top: -30,
            right: -30,
            child: InkResponse(
              onTap: () => Navigator.of(context).pop(),
              child: const CircleAvatar(
                radius: 12,
                child: Icon(Icons.close, size: 18),
                backgroundColor: Colors.red,
              ),
            )),
        TextFormField(
            onChanged: (value) => entiryWord = value,
            decoration: InputDecoration(
                suffixIcon: IconButton(
              icon: const Icon(Icons.done),
              onPressed: () {
                context
                    .read<SearchBloc>()
                    .add(SearchSubmitedEvent(word: entiryWord));
              },
            )))
      ],
    ),
  );
}
