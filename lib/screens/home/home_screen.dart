//  //   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//  Import FILES
import '../../providers/product_provider.dart';
import '../../shared/cart_icon.dart';
//  //  //   ///

// class HomeScreen extends StatelessWidget {
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          // itemCount: 8,
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(15),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: <Widget>[
                  Image.asset(allProducts[index].image, width: 60, height: 60),
                  const SizedBox(height: 10),
                  Text(
                    allProducts[index].title,
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    // textAlign: TextAlign.center,
                    // softWrap: false,
                    // style: const TextStyle(
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.bold,
                    // ),
                  ),
                  Text(
                    '£${allProducts[index].price}',
                    // style: const TextStyle(
                    //   fontSize: 18,
                    //   fontWeight: FontWeight.bold,
                    // ),
                  ),
                  if (cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .removeProduct(allProducts[index]);
                      },
                      child: const Text('Remove from cart'),
                    ),
                  if (!cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {
                        ref
                            .read(cartNotifierProvider.notifier)
                            .addProduct(allProducts[index]);
                      },
                      child: const Text('Add to cart'),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
