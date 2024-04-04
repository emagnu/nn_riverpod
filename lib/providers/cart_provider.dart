//  //   ///
//  Import LIBRARIES
import 'package:riverpod_annotation/riverpod_annotation.dart';
//  Import FILES
import '../models/product.dart';
//  PARTS
part 'cart_provider.g.dart';
//  GENERATED PROVIDERS

//   --- cartNotifierProvider
@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Set<Product> build() {
    return {};
    // return const {
    //   Product(
    //       id: '4',
    //       title: 'Red Backpack',
    //       price: 14,
    //       image: 'assets/products/backpack.png'),
    // };
  }

  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p != product).toSet();
    }
  }
}

//  //  //   ///

