import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddSizeDialog extends StatelessWidget {

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _controller,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(_controller.text);
                },
                child: Text("Add"),
                textColor: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
