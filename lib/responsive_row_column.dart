import 'package:flutter/material.dart';

class ResponsiveRowColumn extends StatelessWidget {
  final List<Widget> children;
  final double tabletBreakpoint;
  final double desktopBreakpoint;
  final double spacing;

  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection? verticalDirection;
  final TextBaseline? textBaseline;

  const ResponsiveRowColumn({
    super.key,
    required this.children,
    this.tabletBreakpoint = 600,
    this.desktopBreakpoint = 1024,
    this.spacing = 0,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.crossAxisAlignment,
    this.textDirection,
    this.verticalDirection,
    this.textBaseline,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < tabletBreakpoint) {
      return Column(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        mainAxisSize: mainAxisSize ?? MainAxisSize.max,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.stretch,
        textDirection: textDirection,
        verticalDirection: verticalDirection ?? VerticalDirection.down,
        textBaseline: textBaseline,
        children: addSpacingBetweenChildren(children, spacing, isRow: false),
      );
    } else if (screenWidth < desktopBreakpoint) {
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: children.map((child) {
          return ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 200,
              maxWidth: 600,
            ),
            child: child,
          );
        }).toList(),
      );
    } else {
      return Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        mainAxisSize: mainAxisSize ?? MainAxisSize.max,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        textDirection: textDirection,
        verticalDirection: verticalDirection ?? VerticalDirection.down,
        textBaseline: textBaseline,
        children: addSpacingBetweenChildren(
          children.map((child) => Expanded(child: child)).toList(),
          spacing,
          isRow: true,
        ),
      );
    }
  }

  List<Widget> addSpacingBetweenChildren(List<Widget> children, double spacing, {required bool isRow}) {
    if (children.isEmpty) return [];

    final spacedChildren = <Widget>[];

    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);

      if (i != children.length - 1) {
        spacedChildren.add(isRow
            ? SizedBox(width: spacing)
            : SizedBox(height: spacing));
      }
    }
    return spacedChildren;
  }
}
