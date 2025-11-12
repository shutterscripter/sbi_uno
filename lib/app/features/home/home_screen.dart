import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:sbi_uno/consts/colors.dart';
import 'package:sbi_uno/widgets/appbar/custom_appbar.dart';
import 'package:sbi_uno/widgets/cards/balance_card.dart';
import 'package:sbi_uno/widgets/drawer/custom_drawer.dart';
import 'package:sbi_uno/widgets/heading/heading.dart';
import 'package:sbi_uno/widgets/quick_links/quick_links.dart';

class HomeScreen extends StatefulWidget {
  final Function(bool)? onDrawerStateChanged;

  const HomeScreen({super.key, this.onDrawerStateChanged});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      onDrawerChanged: (isOpened) {
        widget.onDrawerStateChanged?.call(isOpened);
      },
      body: Column(
        children: [
          CustomAppbar(),
          Heading(
            title: 'Hello',
            subtitle: 'Jayesh',
            hintText: 'Need Any Help?',
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Cards for account balance
                SizedBox(
                  height: 180,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: index == 0
                            ? BalanceCard(
                                title: 'My Savings Acc.',
                                balance: '1,14,401',
                                subtitle: 'Total Balance',
                                cardColor: ColorConsts.accentColor,
                              )
                            : BalanceCard(
                                title: 'Education Loan',
                                balance: '1,00,000',
                                subtitle: 'Total Borrowing',
                                cardColor: ColorConsts.supportingColor,
                              ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                // Page indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    2,
                    (index) => Container(
                      width: _currentPage == index ? 24 : 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: _currentPage == index
                            ? ColorConsts.accentColor
                            : ColorConsts.accentColor.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),

                ///Quick Links
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quick Links',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorConsts.primaryText,
                      ),
                    ),

                    Text(
                      'Show More',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: ColorConsts.accentColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    QuickLinks(
                      title: 'Quick Pay',
                      icon: LucideIcons.receiptIndianRupee,
                      isSelected: true,
                    ),
                    QuickLinks(
                      title: 'Recharge',
                      icon: LucideIcons.smartphone,
                      isSelected: false,
                    ),
                    QuickLinks(
                      title: 'Rewards',
                      icon: LucideIcons.gift,
                      isSelected: false,
                    ),
                    QuickLinks(
                      title: 'Buy Insurance',
                      icon: LucideIcons.umbrella,
                      isSelected: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
