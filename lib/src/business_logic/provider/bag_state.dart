import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

import '../../data/model/bag.dart';

@immutable
class BagState extends Equatable {
  final List<Bag> mainItems;
  final double totalPrice;

  const BagState.initial(List<Bag> mainItems)
      : this(mainItems: mainItems);

  @override
  List<Object?> get props => [mainItems, totalPrice];

  const BagState({
    required this.mainItems,
    this.totalPrice = 0.0,
  });

  BagState copyWith({
    List<Bag>? mainItems,
    double? totalPrice,
  }) {
    return BagState(
      mainItems: mainItems ?? this.mainItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
