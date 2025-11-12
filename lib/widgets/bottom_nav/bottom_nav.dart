import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:sbi_uno/consts/colors.dart';
import '../../app/features/home/home_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  late TabController tabController;
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _onDrawerStateChanged(bool isOpen) {
    if (_isDrawerOpen != isOpen) {
      setState(() {
        _isDrawerOpen = isOpen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      borderRadius: BorderRadius.circular(50),
      duration: const Duration(seconds: 1),
      hideOnScroll: true,
      barColor: ColorConsts.cardColor,
      showIcon: !_isDrawerOpen,
      width: MediaQuery.of(context).size.width * 0.8,
      iconHeight: 35,
      iconWidth: 35,
      reverse: false,
      body: (context, scrollController) => TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(onDrawerStateChanged: _onDrawerStateChanged),
          const Center(child: Text('Yono Pay Screen')),
          const Center(child: Text('Offers Screen')),
          const Center(child: Text('Account Screen')),
        ],
      ),
      child: _isDrawerOpen
          ? const SizedBox.shrink()
          : TabBar(
              unselectedLabelStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: ColorConsts.accentColor,
              ),
              
              labelStyle: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: ColorConsts.accentColor,
              ),
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              dividerColor: Colors.transparent,
              indicator: ShapeDecoration(
                color: ColorConsts.accentColor,
                shape: const StadiumBorder(),

              ),
              indicatorSize: TabBarIndicatorSize.tab,
              splashBorderRadius: const BorderRadius.all(Radius.circular(500)),
              labelColor: Theme.of(context).colorScheme.onPrimary,
              unselectedLabelColor: Theme.of(
                context,
              ).colorScheme.onSurfaceVariant,
              tabs: const [
                Tab(icon: Icon(LucideIcons.house, size: 18), text: 'Home'),
                Tab(icon: Icon(LucideIcons.creditCard, size: 18), text: 'Yono Pay'),
                Tab(icon: Icon(LucideIcons.tag, size: 18), text: 'Offers'),
                Tab(icon: Icon(LucideIcons.landmark, size: 18), text: 'Account'),
              ],
            ),
    );
  }
}
