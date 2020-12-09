import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/shimmer.dart';

class UserTile extends StatelessWidget {
  final Map<String, dynamic> user;

  UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white);
    if (user.containsKey("money"))
      return ListTile(
        title: Text(
          user["name"],
          style: textStyle,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          user["email"],
          style: textStyle,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "Pedidos: ${user["orders"]}",
              style: textStyle,
            ),
            Text(
              "Gasto: R\$${user["money"].toStringAsFixed(2)}",
              style: textStyle,
            ),
          ],
        ),
      );
    else
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 200.0,
              height: 20.0,
              child: Shimmer.fromColors(
                child: Container(
                  color: Colors.white.withAlpha(50),
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                ),
                baseColor: Colors.white,
                highlightColor: Colors.grey,
              ),
            ),
            SizedBox(
              width: 60.0,
              height: 20.0,
              child: Shimmer.fromColors(
                child: Container(
                  color: Colors.white.withAlpha(50),
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                ),
                baseColor: Colors.white,
                highlightColor: Colors.grey,
              ),
            ),
          ],
        ),
      );
  }
}
