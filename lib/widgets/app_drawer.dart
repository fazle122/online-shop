// import 'package:flutter/material.dart';
// import 'package:shop_mobile_app/screens/auth_screen.dart';
// import 'package:shop_mobile_app/screens/orders_screen.dart';
// import 'package:shop_mobile_app/screens/products_overview_screen.dart';
// import 'package:shop_mobile_app/screens/user_products_screen.dart';
//
//
// class AppDrawer extends StatelessWidget{
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: <Widget>[
//           Container(
//               height: 140.0,
//               width: MediaQuery.of(context).size.width,
//               child:
//               DrawerHeader(
//                   margin: EdgeInsets.zero,
//                   padding: EdgeInsets.zero,
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColor,),
//                   child: Stack(children: <Widget>[
//                     Positioned(
//                         top: 20.0,
//                         left: 30.0,
//                         child: Column(
//                           children: <Widget>[
//                             CircleAvatar(
//                               radius:30.0,
// //                  backgroundImage: NetworkImage(),
//                               backgroundImage: AssetImage('assets/profile.png'),
//                             ),
//                             SizedBox(height: 5.0,),
//                             Text('Guest User',style: TextStyle(color: Theme.of(context).textSelectionColor),),
//                           ],
//                         )
//                     ),
//                     Positioned(
//                         top: 20.0,
//                         right: 30.0,
//                         child: Column(
//                           children: <Widget>[
//                             IconButton(
//                               icon: Icon(Icons.exit_to_app,color: Colors.white,size: 25.0,),
//                               onPressed: (){
//                                 Navigator.of(context).pushNamed(AuthScreen.routeName);
//                               },
//                             ),
// //                    SizedBox(height: 5.0,),
//                             Text('Login',style: TextStyle(color: Theme.of(context).textSelectionColor),),
//                           ],
//                         )
//                     ),
//                   ]))
//
//           ),
//
// //          AppBar(title: Text('Hello'),automaticallyImplyLeading: false,),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.shop),
//             title: Text('All products'),
//             onTap: (){
//               Navigator.of(context).pushNamed(ProductsOverviewScreen.routeName);
//             },
//           ),
//           Divider(),
//
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.payment),
//             title: Text('Orders'),
//             onTap: (){
//               Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
//             },
//           ),
//           Divider(),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.power_settings_new),
//             title: Text('Logout'),
//             onTap: (){
//               Navigator.of(context).pushNamed(AuthScreen.routeName);
//             },
//           ),
//           Divider(),
//         ],
//       ),
//     );
//   }
//
// }










import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mobile_app/providers/auth.dart';
import 'package:shop_mobile_app/screens/orders_screen.dart';
import 'package:shop_mobile_app/screens/user_products_screen.dart';


class AppDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(title: Text('Hello'),automaticallyImplyLeading: false,),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Manage products'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            },
          ),

          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context,listen: false).logout();
            },
          ),
        ],
      ),
    );
  }

}