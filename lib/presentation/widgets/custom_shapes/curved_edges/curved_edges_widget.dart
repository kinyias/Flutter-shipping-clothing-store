import 'package:flutter/material.dart';

import 'curved_edges.dart';

class CCurvedEdgeWidget extends StatelessWidget {
  const CCurvedEdgeWidget({
    super.key, required this.child,
  });
  
  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CCustomCurvedEdges(),
      child: child,
    );
  }
}