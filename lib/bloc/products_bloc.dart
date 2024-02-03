import 'package:bloc/bloc.dart';
import 'package:block_cubit/model/productmodel.dart';
import 'package:block_cubit/repo/products_repo.dart';
import 'package:equatable/equatable.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsLoadedEvensts, ProductsState> {
  final ProductsRepo productsRepo;
  ProductsBloc(this.productsRepo) : super(ProductsLoadingState()) {
    on<ProductsLoadedEvensts>((event, emit) async {
      try {
        emit(ProductsLoadingState());
        var data = await productsRepo.getProduct();
        emit(ProductsLoadedState(data));
      } catch (e) {
        emit(ProductsErrorState(e.toString()));
      }
    });
  }
}
