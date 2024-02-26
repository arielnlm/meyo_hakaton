import 'package:get/get.dart';
import 'package:meyo_impact/features/shop/controllers/cart_controller.dart';

import '../features/shop/controllers/brand_controller.dart';
import '../features/personalization/controllers/address_controller.dart';
import '../features/shop/controllers/categories_controller.dart';
import '../features/shop/controllers/checkout_controller.dart';
import '../features/shop/controllers/product_controller.dart';
import '../utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// -- Core
    Get.put(NetworkManager());

    /// -- Product
    Get.put(ProductController());
    Get.put(CheckoutController());

    /// -- Other
    Get.put(AddressController());
    Get.put(CartController());
    Get.put(CategoryController());
    Get.put(BrandController());

  }
}
