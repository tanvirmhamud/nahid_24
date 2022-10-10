import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nahid_24/application/app/shop/product%20order/product_order_state.dart';
import 'package:nahid_24/domain/app/shop/i_shop_repo.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:nahid_24/domain/app/shop/place%20order/product_order_model.dart';
import 'package:nahid_24/infrastucture/app/shop/shop_repo.dart';

final productOrderProvider = StateNotifierProvider.family<ProductOrderNotifier,
    ProductOrderState, ProductOrderModel>((ref, productAmount) {
  return ProductOrderNotifier(productAmount, ShopRepo());
});

class ProductOrderNotifier extends StateNotifier<ProductOrderState> {
  final IShopRepo shopRepo;
  final ProductOrderModel productAmount;
  ProductOrderNotifier(this.productAmount, this.shopRepo)
      : super(ProductOrderState.init());

  init() {
    state = state.copyWith(products: productAmount.product_info.lock);
    Logger.i(state.products);
  }

  increaseProductAmount(int index) {
    final prev = state.products[index];
    final next = state.products
        .replace(index, prev.copyWith(quantity: prev.quantity + 1));
    state = state.copyWith(products: next);
    Logger.i(state.products);
  }

  decreaseProductAmount(int index) {
    final prev = state.products[index];
    final next = state.products
        .replace(index, prev.copyWith(quantity: prev.quantity - 1));
    state = state.copyWith(products: next);
    Logger.i(state.products);
  }

  placeOrder() async {
    state = state.copyWith(loading: true);
    final products = ProductOrderModel(product_info: state.products.unlock);
    final data = await shopRepo.plactOrder(products: products);
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        failure: CleanFailure.none(),
      ),
    );
  }
}
