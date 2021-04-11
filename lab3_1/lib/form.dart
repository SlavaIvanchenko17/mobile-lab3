import 'package:flutter/material.dart';

class FormProduct extends StatelessWidget {
  final dynamic item;
  final Function onPressedFunction;
  final String button;

  FormProduct(this.item, this.onPressedFunction, this.button);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Card(
        elevation: 4.0,
        child: ListTile(
            title: Text(item.name),
            trailing: FlatButton(
              color: button == 'Buy' ? Colors.blue : Colors.red,
              onPressed: (){
                onPressedFunction(item);
              },
              child: Text(button),
            )
        ),
      ),
    );
  }
}
