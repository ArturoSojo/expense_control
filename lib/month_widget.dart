import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_control/graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MonthWidget extends StatefulWidget {
  final List<DocumentSnapshot>? documents;

  const MonthWidget({super.key, this.documents});

  @override
  _MonthWidgetState createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(children: <Widget>[
      _expenses(),
      _graph(),
      Container(
        color: Colors.blueAccent.withOpacity(0.15),
        height: 24.0,
      ),
      _list()
    ]));
  }

  Widget _expenses() {
    return Column(
      children: <Widget>[
        Text(
          "\$2361,41",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),
        ),
        Text(
          "Total expenses",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }

  Widget _graph() {
    return Container(
      height: 250.0,
      child: GraphWidget(),
    );
  }

  Widget _item(IconData icon, String name, int porcent, double value) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32.0,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(
        '$porcent% of expenses',
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.blueGrey,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              '\$$value',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            )),
      ),
    );
  }

  Widget _list() {
    return Expanded(
      child: ListView.separated(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) =>
            _item(FontAwesomeIcons.shoppingCart, "Shopping", 14, 145.12),
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blueAccent.withOpacity(0.15),
            height: 8.0,
          );
        },
      ),
    );
  }
}
