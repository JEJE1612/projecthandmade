import 'package:flutter/material.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/CustomDrawer/owner_Avatar.dart';

class CustomDrawerHeader extends StatefulWidget {
  final bool isCollapsable;

  const CustomDrawerHeader({
    super.key,
    required this.isCollapsable,
  });

  @override
  State<CustomDrawerHeader> createState() => _CustomDrawerHeaderState();
}

class _CustomDrawerHeaderState extends State<CustomDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          const OwnerAvatar(),
          if (widget.isCollapsable) ...[
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "Admin",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
