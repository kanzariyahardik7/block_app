part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsLoadingState extends ProductsState {}

final class ProductsLoadedState extends ProductsState {
  final ProductModel productModel;
  const ProductsLoadedState(this.productModel);

  @override
  List<Object> get props => [productModel];
}

final class ProductsErrorState extends ProductsState {
  final String errorMessage;

  const ProductsErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
