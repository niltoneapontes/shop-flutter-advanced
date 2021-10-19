import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: GestureDetector(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_DETAIL,
                  arguments: product,
                );
              }),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                size: 16,
              ),
              color: Theme.of(context).accentColor,
            ),
            title: Text(product.title, textAlign: TextAlign.center),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                size: 16,
              ),
              color: Theme.of(context).accentColor,
            ),
          )),
    );
  }
}
