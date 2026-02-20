import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Details view not supported on this platform',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
