import 'package:duck_duck_shop/data.dart';
import 'package:duck_duck_shop/registry.dart';
import 'package:flutter/material.dart';

import '../../coordinators.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  Stream<List<ItemData>> _stream;

  @override
  void initState() {
    _stream = Registry.di.repository.items.getAllItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: [
          IconButton(
            onPressed: () {
              Registry.di.repository.auth.signOut();
              Coordinators.toSplash(context);
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: StreamBuilder<List<ItemData>>(
        stream: _stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 9 / 11,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              final data = snapshot.data[index];
              return GestureDetector(
                onTap: () {
                  Coordinators.toDetail(context, data);
                },
                child: Card(
                  child: Column(
                    children: [
                      AspectRatio(aspectRatio: 1, child: Image.network(data.url)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  data.name,
                                  style: Theme.of(context).textTheme.bodyText2,
                                  maxLines: 2,
                                ),
                              ),
                              Text(
                                '\$${data.price}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
