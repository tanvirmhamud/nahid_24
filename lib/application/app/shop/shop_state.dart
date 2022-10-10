// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import 'package:nahid_24/domain/app/shop/my_orders_model.dart';
import 'package:nahid_24/domain/app/shop/product_model.dart';

class ShopState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final List<ProductModel> products;
  final List<MyOrdersModel> myOrders;
  ShopState({
    required this.loading,
    required this.failure,
    required this.products,
    required this.myOrders,
  });

  ShopState copyWith({
    bool? loading,
    CleanFailure? failure,
    List<ProductModel>? products,
    List<MyOrdersModel>? myOrders,
  }) {
    return ShopState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      products: products ?? this.products,
      myOrders: myOrders ?? this.myOrders,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [loading, failure, products, myOrders];

  factory ShopState.init() => ShopState(
        loading: false,
        failure: CleanFailure.none(),
        products: [],
        myOrders: [],
      );
}
