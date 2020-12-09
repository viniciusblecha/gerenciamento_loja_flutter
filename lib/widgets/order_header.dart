import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_loja/blocs/user_bloc.dart';

class OrderHeader extends StatelessWidget {
  final DocumentSnapshot _order;

  OrderHeader(this._order);

  @override
  Widget build(BuildContext context) {
    final _userBloc = BlocProvider.of<UserBloc>(context);

    final _user = _userBloc.getUser(_order.data["clientId"]);
    
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_user["name"]),
              Text(_user["address"]),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "Produtos: R\$${_order.data["productsPrice"].toStringAsFixed(2)}",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            Text("Total: R\$${_order.data["totalPrice"].toStringAsFixed(2)}"),
          ],
        ),
      ],
    );
  }
}
