import 'package:flutter/material.dart';
import 'package:shop/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: Text('Bem vinde'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.store),
          title: Text('Loja'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.local_shipping),
          title: Text('Pedidos'),
          onTap: () =>
              Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS),
        ),
      ],
    ));
  }
}
