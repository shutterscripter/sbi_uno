import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:sbi_uno/consts/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          // Drawer Header
          Container(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            decoration: BoxDecoration(
              color: ColorConsts.accentColor.withValues(alpha: 0.1),
            ),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: ColorConsts.accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    LucideIcons.user,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Jayesh Shinde',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  icon: Icon(LucideIcons.x, size: 20),
                ),
              ],
            ),
          ),

          // Menu Items
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _DrawerItem(
                        icon: LucideIcons.user,
                        iconColor: ColorConsts.accentColor,
                        title: 'Edit Profile',
                        onTap: () {
                          Navigator.pop(context);
                          // Navigate to Edit Profile
                        },
                      ),
                      _DrawerItem(
                        icon: LucideIcons.phone,
                        title: 'Emergency',
                        iconColor: Colors.deepOrange,
                        onTap: () {
                          Navigator.pop(context);
                          // Navigate to Emergency
                        },
                      ),
                      _DrawerItem(
                        icon: LucideIcons.star,
                        iconColor: Colors.orange,
                        title: 'Reward Points',
                        onTap: () {
                          Navigator.pop(context);
                          // Navigate to Reward Points
                        },
                      ),
                      _DrawerItem(
                        icon: LucideIcons.messageCircle,
                        iconColor: Colors.green,
                        title: 'Support',
                        onTap: () {
                          Navigator.pop(context);
                          // Navigate to Support
                        },
                      ),
                      _DrawerItem(
                        icon: LucideIcons.mapPin,
                        title: 'Locate Branch ATM',
                        iconColor: Colors.deepPurpleAccent,
                        onTap: () {
                          Navigator.pop(context);
                          // Navigate to Locate Branch ATM
                        },
                      ),
                      _DrawerItem(
                        icon: LucideIcons.settings,
                        iconColor: Colors.blueGrey,
                        title: 'Settings',
                        onTap: () {
                          Navigator.pop(context);
                          // Navigate to Locate Branch ATM
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: ColorConsts.cardColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "Logout From Yono",

                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorConsts.supportingColor,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? ColorConsts.primaryText,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor ?? ColorConsts.primaryText,
        ),
      ),
      onTap: onTap,
    );
  }
}
