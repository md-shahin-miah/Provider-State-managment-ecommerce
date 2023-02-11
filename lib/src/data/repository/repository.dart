import 'package:flutter/material.dart';

import '../../../core/app_asset.dart';
import '../model/bag.dart';
import '../model/bag_color.dart';

class Repository {
  get getFurnitureList {
    const dummyText =
        """Lorem Ipsum is simply dummy text of the printing and typesetting
       industry. Lorem Ipsum has been the industry's standard dummy text ever
        since the 1500s, when an unknown printer took a galley of type and
         scrambled it to make a type specimen book. It has survived not only 
         five centuries, but also the leap into electronic typesetting,
          remaining essentially unchanged. It was popularised in the 1960s with
           the release of Letraset sheets containing Lorem Ipsum passages,
            and more recently with desktop publishing software like Aldus
             PageMaker including versions of Lorem Ipsum.""";

    List<Bag> furnitureList = [
      Bag(
        id: 1,
        quantity: 1,
        isFavorite: false,
        title: 'Ladies School Bag All in One',
        description: dummyText,
        price: 469.99,
        score: 3.5,
        images: const [
          AppAsset.schoolBagLadies1,
          AppAsset.schoolBagLadies2,
          AppAsset.schoolBagLadies3,
          AppAsset.schoolBagLadies4,
          AppAsset.schoolBagLadies5,
          AppAsset.schoolBagLadies7,
          AppAsset.schoolBagLadies6,
        ],
        colors: <BagColor>[
          BagColor(color: const Color(0xFF00B7B7), isSelected: true),
          BagColor(color: const Color(0xFF00C294)),
        ],
      ),
      Bag(
        id: 2,
        isFavorite: false,
        quantity: 1,
        title: 'Gents School bag',
        description: dummyText,
        price: 299.99,
        score: 4.5,
        images: const [
          AppAsset.gentsBag1,
          AppAsset.gentsBag2,
          AppAsset.gentsBag3,
          AppAsset.gentsBag4,
          AppAsset.gentsBag5,
        ],
        colors: <BagColor>[
          BagColor(color: const Color(0xffe23e51), isSelected: true),
          BagColor(color: const Color(0xFF028068)),
        ],
      ),
      Bag(
        id: 3,
        quantity: 1,
        isFavorite: false,
        title: 'Ladies Hand Bags',
        description: dummyText,
        price: 659.99,
        score: 3.0,
        images: const [
          AppAsset.ladiesHandBag1,
          AppAsset.ladiesHandBag2,
          AppAsset.ladiesHandBag3,
          AppAsset.ladiesHandBag4,
          AppAsset.ladiesHandBag5,
          AppAsset.ladiesHandBag6,
        ],
        colors: <BagColor>[
          BagColor(color: const Color(0xFF00B7B7), isSelected: true),
          BagColor(color: const Color(0xFF00C294)),
        ],
      ),
      Bag(
        id: 4,
        quantity: 1,
        isFavorite: false,
        title: 'Boys hand bag',
        description: dummyText,
        price: 349.99,
        score: 2.5,
        images: const [
          AppAsset.boysHandsBag1,
          AppAsset.boysHandsBag2,
          AppAsset.boysHandsBag3,
          AppAsset.boysHandsBag4,
          AppAsset.boysHandsBag5,
          AppAsset.boysHandsBag6,
        ],
        colors: <BagColor>[
          BagColor(color: const Color(0xff00aaff), isSelected: true),
          BagColor(color: const Color(0xFFE23E51)),
        ],
      ),
      Bag(
        id: 5,
        quantity: 1,
        isFavorite: false,
        title: 'Ladies party bag',
        description: dummyText,
        price: 499.99,
        score: 2.8,
        images: const [
          AppAsset.ladiesPartsBag1,
          AppAsset.ladiesPartsBag2,
          AppAsset.ladiesPartsBag3,
          AppAsset.ladiesPartsBag4,
          AppAsset.ladiesPartsBag5,
        ],
        colors: <BagColor>[
          BagColor(color: const Color(0xffff3d00), isSelected: true),
          BagColor(color: const Color(0xff000000)),
        ],
      ),
    ];

    return furnitureList;
  }
}
