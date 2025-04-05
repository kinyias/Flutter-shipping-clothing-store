import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular.dart';

class CPrimaryHeaderContainer extends StatelessWidget {
  const CPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CCurvedEdgeWidget(
     child: SizedBox(
          height: 255,
          child: Container(
            color: CColors.primary,
            child: Stack(
              children: [
                Positioned(
                    top: -150,
                    right: -250,
                    child: CCircularContainer(
                        backgroundColor: CColors.textWhite.withOpacity(0.1))),
                Positioned(
                    top: 100,
                    right: -300,
                    child: CCircularContainer(
                        backgroundColor: CColors.textWhite.withOpacity(0.1))),
                child,
              ],
            ),
          )
        ),
    );
  }
}