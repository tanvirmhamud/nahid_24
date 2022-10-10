import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nahid_24/application/app/shop/shop_card_state.dart';
import 'package:nahid_24/domain/app/shop/product_model.dart';

// import 'package:shared_preferences/shared_preferences.dart';
final shopCartProvider =
    StateNotifierProvider<ShopCardNotifier, ShopCardState>((ref) {
  return ShopCardNotifier();
});

class ShopCardNotifier extends StateNotifier<ShopCardState> {
  ShopCardNotifier() : super(ShopCardState.init());

  addToCart(ProductModel product) {
    Logger.i(state.products);
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    final cart = state.products;
    if (!cart.contains(product)) {
      final updatedCart = cart.add(product);
      state = state.copyWith(products: updatedCart);
    }
    Logger.i(state.products);
  }
}
