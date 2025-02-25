import 'package:flutter/material.dart';
import 'package:vnpt_his/features/product/data/models/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel productModel;

  const ProductItemWidget({
    super.key,
    required this.productModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 4,
            ),
          ],
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            productModel.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.asset(
              productModel.imagePath,
              fit: BoxFit.fitWidth,
            ),
          )),
          Text(productModel.description, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
