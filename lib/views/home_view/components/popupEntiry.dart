import 'package:flutter/material.dart';

Widget PopUpEntiryForm(BuildContext context) {
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
            decoration: InputDecoration(
                suffixIcon: IconButton(
          icon: const Icon(Icons.done),
          onPressed: () {
            // fetch data and send to bloc
          },
        )))
      ],
    ),
  );
}
