import 'package:flutter/material.dart';
import 'package:handmade/cors/theme/colors.dart';
import 'package:handmade/feather/pages/Admin/presention/widgets/CustomDrawer/owner_avatar.dart';

class CustomDrawerHeader extends StatefulWidget {
  final bool isCollapsable;

  const CustomDrawerHeader({
    super.key,
    required this.isCollapsable,
    required this.name,
    required this.image,
  });
  final String name;
  final String image;

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
          OwnerAvatar(
            image: widget.image,
          ),
          if (widget.isCollapsable) ...[
            SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.name,
                style: TextStyle(
                  color: textBlack,
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
