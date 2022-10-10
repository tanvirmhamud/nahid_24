// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:nahid_24/domain/app/shop/place%20order/product_amount_model.dart';

class ProductOrderState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final IList<ProductAmountModel> products;
  ProductOrderState({
    required this.loading,
    required this.failure,
    required this.products,
  });

  ProductOrderState copyWith({
    bool? loading,
    CleanFailure? failure,
    IList<ProductAmountModel>? products,
  }) {
    return ProductOrderState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      products: products ?? this.products,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [loading, failure, products];

  factory ProductOrderState.init() => ProductOrderState(
      loading: false,
      failure: CleanFailure.none(),
      products: const IListConst([]));
}
