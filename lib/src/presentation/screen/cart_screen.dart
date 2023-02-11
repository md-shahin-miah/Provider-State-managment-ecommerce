import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../business_logic/provider/bag_provider.dart';
import '../../data/model/bag.dart';
import '../widget/bottom_bar.dart';
import '../widget/cart_list_view.dart';
import '../widget/counter_button.dart';
import '../widget/empty_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Bag> cartList =
        context.watch<BagProvider>().getCartList;

    final totalPrice = context.watch<BagProvider>().state.totalPrice;

    PreferredSizeWidget appBar() {
      return AppBar(
        title: const Text("Cart", style: h2Style),
        actions: [
          IconButton(
            splashRadius: 20.0,
            onPressed: () {
              context.read<BagProvider>().clearCart();
            },
            icon: const Icon(Icons.delete, color: AppColor.lightBlack),
          )
        ],
      );
    }

    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: BottomBar(
        priceLabel: "Total price",
        priceValue: "\$${totalPrice.toStringAsFixed(2)}",
        buttonLabel: "Checkout",
        onTap: totalPrice > 0 ? () {} : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: cartList.isNotEmpty
            ? CartListView(
                furnitureItems: cartList,
                counterButton: (furniture, index) {
                  return CounterButton(
                    orientation: Axis.vertical,
                    onIncrementSelected: () {
                      context
                          .read<BagProvider>()
                          .increaseQuantity(cartList[index],);
                    },
                    onDecrementSelected: () {
                      context
                          .read<BagProvider>()
                          .decreaseQuantity(cartList[index]);
                    },
                    label: furniture.quantity,
                  );
                },
              )
            : const EmptyWidget(title: "Empty cart"),
      ),
    );
  }
}
