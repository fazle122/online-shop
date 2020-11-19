import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mobile_app/providers/auth.dart';
import 'package:shop_mobile_app/screens/auth_screen.dart';
import 'package:shop_mobile_app/screens/orders_screen.dart';
import 'package:shop_mobile_app/screens/user_products_screen.dart';


class AppDrawer extends StatelessWidget{

  Widget _drawerItem(BuildContext context,IconData leadingIcon,String title,String route){

  return ListTile(
      leading: Icon(leadingIcon),
      title: Text(title),
      onTap: (){
        if(title =='Logout'){
          Provider.of<Auth>(context,listen: false).logout();
        }
        Navigator.of(context).pushReplacementNamed(route);
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              height: 140.0,
              width: MediaQuery.of(context).size.width,
              child: DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 20.0,
                        left: 30.0,
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage('assets/profile.png'),
                            ),
                          ],
                        )),
                  ]))),
          Divider(),
          _drawerItem(context, Icons.shop, 'All products', '/'),

          Divider(),
          _drawerItem(context, Icons.shop, 'Manage products', UserProductsScreen.routeName),

          Divider(),
          _drawerItem(context, Icons.payment, 'Orders', OrdersScreen.routeName),

          Divider(),
          _drawerItem(context, Icons.exit_to_app, 'Logout', '/'),

        ],
      ),
    );
  }

}