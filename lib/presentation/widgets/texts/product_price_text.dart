import 'package:shipping_clothing_store/core/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';

class CProductPriceText extends StatelessWidget {
  const CProductPriceText({
    super.key,
    // this.currencySign = 'đ',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final double price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text( CFormatter.formatCurrency(price),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: isLarge
            ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null));
  }
}
