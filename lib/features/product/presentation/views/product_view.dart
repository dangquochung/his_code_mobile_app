import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:vnpt_his/core/common/app_locale.dart';
import 'package:vnpt_his/core/common/widgets/base_app_bar.dart';
import 'package:vnpt_his/features/product/presentation/widgets/product_item_widget.dart';
import '../bloc/product_bloc.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(),
      child: Scaffold(
        appBar: BaseAppBar(
          title: AppLocale.product.getString(context),
          needBackButton: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.5,
                ),
                itemCount: state.listProducts.length,
                itemBuilder: (context, index) {
                  return ProductItemWidget(productModel: state.listProducts[index]);
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
