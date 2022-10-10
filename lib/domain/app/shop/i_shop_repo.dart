import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/domain/app/shop/my_orders_model.dart';
import 'package:nahid_24/domain/app/shop/place%20order/product_order_model.dart';
import 'package:nahid_24/domain/app/shop/product_model.dart';

abstract class IShopRepo {
  Future<Either<CleanFailure, List<ProductModel>>> getAllProducts();
  Future<Either<CleanFailure, Unit>> plactOrder(
      {required ProductOrderModel products});
  Future<Either<CleanFailure, List<MyOrdersModel>>> getMyOrders();
}
