import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class NavigationLayout extends StatefulWidget {
  final Widget child;
  final int selectedIndex;
  final Function(int)? onDestinationSelected;
  
  const NavigationLayout({
    super.key,
    required this.child,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  @override
  State<NavigationLayout> createState() => _NavigationLayoutState();
}

class _NavigationLayoutState extends State<NavigationLayout>
    with TickerProviderStateMixin {
  bool _isExtended = false;
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;

  final List<NavigationItem> _navigationItems = [
    NavigationItem(
      route: '/library',
      icon: Icons.library_books_outlined,
      selectedIcon: Icons.library_books,
      labelKey: 'library',
    ),
    NavigationItem(
      route: '/dictionary',
      icon: Icons.book_outlined,
      selectedIcon: Icons.book,
      labelKey: 'dictionary',
    ),
    NavigationItem(
      route: '/settings',
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
      labelKey: 'settings',
    ),
    NavigationItem(
      route: '/about',
      icon: Icons.info_outlined,
      selectedIcon: Icons.info,
      labelKey: 'about',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _widthAnimation = Tween<double>(
      begin: 80.0,
      end: 256.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _navigateToPage(int index) {
    if (index != widget.selectedIndex && widget.onDestinationSelected != null) {
      widget.onDestinationSelected!(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isSmallScreen = width < 600;

    if (isSmallScreen) {
      return _buildMobileLayout(context);
    } else {
      return _buildDesktopLayout(context);
    }
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: _navigateToPage,
        destinations: _navigationItems.map((item) {
          final label = _getLabel(context, item.labelKey);
          return NavigationDestination(
            icon: Icon(item.icon),
            selectedIcon: Icon(item.selectedIcon),
            label: label,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final navRailTheme = Theme.of(context).navigationRailTheme;

    Widget buildTrailingItem(NavigationItem item, int index) {
      final isSelected = widget.selectedIndex == index;
      final iconColor = isSelected
          ? navRailTheme.selectedIconTheme?.color
          : navRailTheme.unselectedIconTheme?.color;
      final labelStyle = isSelected
          ? navRailTheme.selectedLabelTextStyle
          : navRailTheme.unselectedLabelTextStyle;
      final label = _getLabel(context, item.labelKey);

      return AnimatedBuilder(
        animation: _widthAnimation,
        builder: (context, child) {
          final isExtended = _widthAnimation.value > 120;
          
          return Container(
            width: isExtended ? _widthAnimation.value - 24 : 72,
            height: 56,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Material(
              color: isSelected 
                  ? Colors.blue.withValues(alpha: 0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(28),
              child: InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: () => _navigateToPage(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        isSelected ? item.selectedIcon : item.icon, 
                        color: iconColor,
                        size: 24,
                      ),
                      if (isExtended && _widthAnimation.value > 140) ...[
                        const SizedBox(width: 12),
                        Expanded(
                          child: Opacity(
                            opacity: ((_widthAnimation.value - 140) / 116).clamp(0.0, 1.0),
                            child: Text(
                              label, 
                              style: labelStyle,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Row(
        children: [
          AnimatedBuilder(
            animation: _widthAnimation,
            builder: (context, child) {
              return Container(
                width: _widthAnimation.value,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: navRailTheme.backgroundColor,
                ),
                child: Stack(
                  children: [
                    // Основний вміст NavigationRail
                    Positioned(
                      top: 72,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Основні розділи
                          buildTrailingItem(_navigationItems[0], 0),
                          buildTrailingItem(_navigationItems[1], 1),
                          // Spacer для розташування елементів внизу
                          const Spacer(),
                          // Нижні елементи
                          buildTrailingItem(_navigationItems[2], 2),
                          buildTrailingItem(_navigationItems[3], 3),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    // Кнопка меню
                    Positioned(
                      top: 4,
                      left: 12,
                      child: Container(
                        width: 56,
                        height: 56,
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(28),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(28),
                            onTap: () {
                              setState(() {
                                _isExtended = !_isExtended;
                                if (_isExtended) {
                                  _animationController.forward();
                                } else {
                                  _animationController.reverse();
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                child: Icon(
                                  _isExtended ? Icons.menu_open : Icons.menu,
                                  key: ValueKey(_isExtended),
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Expanded(
            child: widget.child,
          ),
        ],
      ),
    );
  }

  String _getLabel(BuildContext context, String labelKey) {
    switch (labelKey) {
      case 'library':
        return S.of(context).library;
      case 'dictionary':
        return S.of(context).dictionary;
      case 'settings':
        return S.of(context).settings;
      case 'about':
        return S.of(context).about;
      default:
        return '';
    }
  }
}

class NavigationItem {
  final String route;
  final IconData icon;
  final IconData selectedIcon;
  final String labelKey;

  NavigationItem({
    required this.route,
    required this.icon,
    required this.selectedIcon,
    required this.labelKey,
  });
}
