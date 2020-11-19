import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mobile_app/providers/orders.dart';
import 'package:shop_mobile_app/utility/util.dart';
import 'package:shop_mobile_app/widgets/app_drawer.dart';
import 'package:shop_mobile_app/widgets/order_item.dart';


class OrdersScreen extends StatelessWidget {

  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('your orders'),),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context,listen: false).fetchOrders(),
        builder: (context,dataSnapshot) {
          if(dataSnapshot.connectionState == ConnectionState.waiting) {
            return Util.loadingIndicator();
          }else{
            if(dataSnapshot.error != null){
              return Center(child: Text('error occurred'),);
            }else{
              return Consumer<Orders>(builder: (context,orderData,child) =>
              orderData.orders.length>0?
                  ListView.builder(
                    itemCount: orderData.orders.length,
                    itemBuilder: (context,i) =>
                    OrderItemWidget(orderData.orders[i]))
                  :Center(child: Text('No order found'),
              ));
            }
          }
        }
      ),
    );
  }

}