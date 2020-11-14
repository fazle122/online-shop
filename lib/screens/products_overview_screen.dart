import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mobile_app/providers/cart.dart';
import 'package:shop_mobile_app/providers/products.dart';
import 'package:shop_mobile_app/screens/cart_screen.dart';
import 'package:shop_mobile_app/widgets/app_drawer.dart';
import 'package:shop_mobile_app/widgets/badge.dart';

import '../widgets/products_grid.dart';

enum FilterOptios { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState(){
//    Future.delayed(Duration.zero).then((_){
//      Provider.of<Products>(context).fetchAndSetProducts();
//    });
    super.initState();
  }

  @override
  void didChangeDependencies(){
    if(_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_){
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptios selectedValue) {
              setState(() {
                if (selectedValue == FilterOptios.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptios.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptios.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (context, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading ? Center(child: CircularProgressIndicator(),):ProductsGrid(_showOnlyFavorites),
    );
  }
}
