import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nahid_24/application/app/shop/shop_state.dart';
import 'package:nahid_24/domain/app/shop/i_shop_repo.dart';
import 'package:nahid_24/domain/app/shop/place%20order/product_order_model.dart';
import 'package:nahid_24/infrastucture/app/shop/shop_repo.dart';

final shopProvider = StateNotifierProvider<ShopNotifier, ShopState>((ref) {
  return ShopNotifier(ShopRepo());
});

class ShopNotifier extends StateNotifier<ShopState> {
  final IShopRepo shopRepo;
  ShopNotifier(this.shopRepo) : super(ShopState.init());

  getAllProducts() async {
    state = state.copyWith(loading: true);
    final data = await shopRepo.getAllProducts();
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        products: r,
        failure: CleanFailure.none(),
      ),
    );
    Logger.i(state.products);
  }

  getMyOrders() async {
    state = state.copyWith(loading: true);
    final data = await shopRepo.getMyOrders();
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        myOrders: r,
        failure: CleanFailure.none(),
      ),
    );
    Logger.i(state.myOrders);
  }
}
