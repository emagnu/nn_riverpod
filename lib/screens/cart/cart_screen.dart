//  //   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//  Import FILES
import '../../providers/cart_provider.dart';
import '../../providers/product_provider.dart';
//  PARTS
//  PROVIDERS
//  //  //   ///

// class CartScreen extends StatefulWidget {
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    // final cartProducts = ref.watch(reducedProductsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              // children: [], // output cart products here
              children: cartProducts.map((product) {
                return Container(
                  // margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Image.asset(product.image, width: 60, height: 60),
                      const SizedBox(width: 10),
                      Text(product.title),
                      const Expanded(child: SizedBox(width: 10)),
                      Text('£${product.price}'),
                    ],
                  ),
                );
              }).toList(),
            ),

            // output totals here
          ],
        ),
      ),
    );
  }
}
