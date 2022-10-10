// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'package:nahid_24/domain/app/shop/product_model.dart';

class ShopCardState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final IList<ProductModel> products;
  ShopCardState({
    required this.loading,
    required this.failure,
    required this.products,
  });

  ShopCardState copyWith({
    bool? loading,
    CleanFailure? failure,
    IList<ProductModel>? products,
  }) {
    return ShopCardState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      products: products ?? this.products,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [loading, failure, products];

  factory ShopCardState.init() => ShopCardState(
      loading: false,
      failure: CleanFailure.none(),
      products: const IListConst([]));
}
