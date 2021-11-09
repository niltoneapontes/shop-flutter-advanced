import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Gerenciar produtos'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: products.itemsCount,
              itemBuilder: (ctx, i) => Column(
                children: [
                  ProductItem(product: products.items[i]),
                  Divider(),
                ],
              ),
            )));
  }
}
