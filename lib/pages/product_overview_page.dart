import 'package:flutter/material.dart';
import 'package:shop/components/product_grid.dart';

class ProductOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Minha loja'),
        ),
        body: ProductGrid());
  }
}
