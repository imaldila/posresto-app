// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_posresto_app/data/models/response/product_response_model.dart';

class ProductQuantity {
  final Product product;
  int quantity;

  ProductQuantity({
    required this.product,
    required this.quantity,
  });

  @override
  bool operator ==(covariant ProductQuantity other) {
    if (identical(this, other)) return true;

    return other.product == product && other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}
