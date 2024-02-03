import 'package:block_cubit/bloc/products_bloc.dart';
import 'package:block_cubit/ui_helper/colors.dart';
import 'package:block_cubit/ui_helper/mynetworkimage.dart';
import 'package:block_cubit/ui_helper/mytext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  void initState() {
    // BlocProvider.of<ProductsBloc>(context, listen: false);
    context.read<ProductsBloc>().add(ProductsLoadedEvensts());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        iconTheme: const IconThemeData(color: white),
        title: const MyText(
          text: "Product Details",
          color: white,
          fontsize: 24,
        ),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ProductsLoadedState) {
            return ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Row(
                    children: [
                      MyNetworkImage(
                          imgHeight: 85,
                          imgWidth: 85,
                          imageUrl: state.productModel.image,
                          fit: BoxFit.contain),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: state.productModel.title.toString(),
                              color: black,
                              maxlines: 2,
                              fontweight: FontWeight.w600,
                              fontsize: 18,
                            ),
                            Row(
                              children: [
                                MyText(
                                  text: "₹ ${state.productModel.price}",
                                  color: red,
                                  maxlines: 2,
                                  fontweight: FontWeight.w600,
                                  fontsize: 15,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                MyText(
                                  text: state.productModel.rating?.rate
                                          .toString() ??
                                      "",
                                  color: blue,
                                  maxlines: 2,
                                  fontweight: FontWeight.w600,
                                  fontsize: 15,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: blue,
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                MyText(
                                  text: state.productModel.rating?.count
                                          .toString() ??
                                      "",
                                  color: blue,
                                  maxlines: 2,
                                  fontweight: FontWeight.w600,
                                  fontsize: 15,
                                ),
                                const Icon(
                                  Icons.download,
                                  color: blue,
                                  size: 18,
                                )
                              ],
                            ),
                            MyText(
                              text: state.productModel.category.toString(),
                              color: teal,
                              maxlines: 2,
                              fontweight: FontWeight.w600,
                              fontsize: 15,
                            ),
                            MyText(
                              text: state.productModel.description.toString(),
                              color: gray,
                              maxlines: 10,
                              fontweight: FontWeight.w600,
                              fontsize: 14,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else if (state is ProductsErrorState) {
            return Center(
              child: MyText(
                text: state.errorMessage,
                color: black,
                fontsize: 18,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
