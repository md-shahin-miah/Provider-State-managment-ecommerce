import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/app_style.dart';
import '../../business_logic/provider/bag_provider.dart';
import '../../data/model/bag.dart';
import '../widget/empty_widget.dart';
import '../widget/bag_list_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Bag> favoriteList = context.watch<BagProvider>().getFavoriteList;

    return Scaffold(
      appBar: AppBar(title: const Text("Favorites", style: h2Style)),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              favoriteList.isNotEmpty
                  ? FurnitureListView(
                      isHorizontal: false,
                      furnitureList: favoriteList,
                    )
                  : const EmptyWidget(
                      type: EmptyWidgetType.favorite,
                      title: "Empty favorite",
                    )
            ],
          ),
        ),
      ),
    );
  }
}
