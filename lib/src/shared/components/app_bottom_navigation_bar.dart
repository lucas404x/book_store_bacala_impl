import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;
  final List<AppNavItem> navItems;

  const AppBottomNavigationBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
    this.navItems = const [],
  });

  @override
  Widget build(BuildContext context) {
    final items = <_BottomNavigationItem>[];

    for (var i = 0; i < navItems.length; i++) {
      items.add(
        _BottomNavigationItem(
          index: i,
          navItem: navItems[i],
          onSelectItem: onTap,
          selected: currentIndex == i,
        ),
      );
    }

    const radius = Radius.circular(18);

    return Container(
      height: 95.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(topLeft: radius, topRight: radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 20,
            spreadRadius: 10,
          )
        ],
      ),
      child: Row(
        children: [
          const Spacer(),
          ...items,
          const Spacer(),
        ],
      ),
    );
  }
}

class AppNavItem {
  final IconData selectIconData;
  final IconData unselectIconData;
  final String label;

  const AppNavItem({
    required this.selectIconData,
    required this.unselectIconData,
    required this.label,
  });
}

class _BottomNavigationItem extends StatelessWidget {
  final int index;
  final AppNavItem navItem;
  final bool selected;
  final void Function(int)? onSelectItem;

  const _BottomNavigationItem({
    required this.index,
    required this.navItem,
    this.selected = false,
    this.onSelectItem,
  });

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => onSelectItem?.call(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              selected ? navItem.selectIconData : navItem.unselectIconData,
              color: selected ? secondaryColor : Colors.grey,
              size: 30,
              shadows: selected ? [
                BoxShadow(
                  blurRadius: 30,
                  spreadRadius: 20,
                  offset: const Offset(2, 10),
                  color: secondaryColor.withOpacity(.35)
                )
              ] : null,
            ),
            Text(
              navItem.label,
              style: textTheme.subtitle1?.copyWith(
                fontSize: 12,
                color: selected ? secondaryColor : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
