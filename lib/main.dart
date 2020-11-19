import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mobile_app/providers/auth.dart';
import 'package:shop_mobile_app/providers/cart.dart';
import 'package:shop_mobile_app/providers/orders.dart';
import 'package:shop_mobile_app/providers/products.dart';
import 'package:shop_mobile_app/screens/auth_screen.dart';
import 'package:shop_mobile_app/screens/cart_screen.dart';
import 'package:shop_mobile_app/screens/manage_product_screen.dart';
import 'package:shop_mobile_app/screens/orders_screen.dart';
import 'package:shop_mobile_app/screens/product_detail_screen.dart';
import 'package:shop_mobile_app/screens/products_overview_screen.dart';
import 'package:shop_mobile_app/screens/splash_screen.dart';
import 'package:shop_mobile_app/screens/user_products_screen.dart';
import 'package:shop_mobile_app/style/app_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            update: (ctx, auth, previousProducts) => Products(
              auth.token,
              auth.userId,
              previousProducts == null ? [] : previousProducts.items,
            ),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProxyProvider<Auth, Orders>(
            update: (ctx, auth, previousOrders) => Orders(
              auth.token,
              auth.userId,
              previousOrders == null ? [] : previousOrders.orders,
            ),
          ),
        ],
        child:
        Consumer<Auth>(
          builder: (ctx, auth, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MyShop',
            theme: AppTheme.shopTheme(),
            home: auth.isAuth
                ? ProductsOverviewScreen()
                : FutureBuilder(
              future: auth.tryAutoLogin(),
              builder: (ctx, authResultSnapshot) =>
              authResultSnapshot.connectionState == ConnectionState.waiting
                  ? SplashScreen() : AuthScreen(),
            ),
            routes: {
              ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
              CartScreen.routeName: (context) => CartScreen(),
              OrdersScreen.routeName: (context) => OrdersScreen(),
              UserProductsScreen.routeName: (context) => UserProductsScreen(),
              ManageProductScreen.routeName: (context) => ManageProductScreen(),
            },
          ),
        )
    );
  }
}
