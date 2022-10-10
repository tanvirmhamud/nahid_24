import 'package:clean_api/clean_api.dart';
import 'package:nahid_24/domain/app/shop/i_shop_repo.dart';
import 'package:nahid_24/domain/app/shop/product_model.dart';
import 'package:nahid_24/domain/app/shop/place%20order/product_order_model.dart';
import 'package:nahid_24/domain/app/shop/my_orders_model.dart';

class ShopRepo extends IShopRepo {
  final cleanApi = CleanApi.instance;
  @override
  Future<Either<CleanFailure, List<ProductModel>>> getAllProducts() async {
    return cleanApi.get(
        fromData: ((json) => List<ProductModel>.from(
            json["data"].map((e) => ProductModel.fromMap(e)))),
        endPoint: 'product');
  }

  @override
  Future<Either<CleanFailure, List<MyOrdersModel>>> getMyOrders() async {
    return cleanApi.get(
      fromData: ((json) => List<MyOrdersModel>.from(
          json["data"].map((e) => MyOrdersModel.fromMap(e)))),
      endPoint: 'order',
    );
  }

  @override
  Future<Either<CleanFailure, Unit>> plactOrder(
      {required ProductOrderModel products}) async {
    return cleanApi.post(
        fromData: (json) => unit, body: products.toMap(), endPoint: 'order');
  }
}
