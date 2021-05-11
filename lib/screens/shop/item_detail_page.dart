import 'package:duck_duck_shop/data.dart';
import 'package:flutter/material.dart';

class ItemDetailPage extends StatefulWidget {
  const ItemDetailPage({Key key, @required this.item}) : super(key: key);

  final ItemData item;

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              widget.item.name,
              style: Theme.of(context).textTheme.bodyText2,
              maxLines: 1,
            ),
            Text(
              '\$${widget.item.price}',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: AspectRatio(aspectRatio: 1, child: Image.network(widget.item.url)),
      ),
    );
  }
}
