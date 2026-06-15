import 'package:flutter/material.dart';

class SettingMenuItem extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String? trailingText;
  final bool showBorder;
  final VoidCallback? onTap;
  final bool useToggle;
  final bool initialToggleValue;
  final ValueChanged<bool>? onToggleChanged;

  const SettingMenuItem({
    super.key,
    required this.title,
    this.subtitle,
    this.trailingText,
    required this.showBorder,
    this.onTap,
    this.useToggle = false,
    this.initialToggleValue = false,
    this.onToggleChanged,
  });

  @override
  State<SettingMenuItem> createState() => _SettingMenuItemState();
}

class _SettingMenuItemState extends State<SettingMenuItem> {
  late bool _toggleValue;

  @override
  void initState() {
    super.initState();
    _toggleValue = widget.initialToggleValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              if (widget.subtitle != null) ...[
                const SizedBox(height: 1), // Ubah angka ini untuk mengatur jarak (bisa 0, 1, 2, dst)
                Text(
                  widget.subtitle!,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                ),
              ],
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.trailingText != null)
                Text(
                  widget.trailingText!,
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade500),
                ),
              if (widget.trailingText != null) const SizedBox(width: 8),
              if (widget.useToggle)
                Switch(
                  value: _toggleValue,
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xFF910A19),
                  inactiveThumbColor: const Color(0xFF910A19),
                  inactiveTrackColor: Colors.white,
                  trackOutlineColor: MaterialStateProperty.all(
                    const Color(0xFF910A19),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _toggleValue = value;
                    });
                    if (widget.onToggleChanged != null) {
                      widget.onToggleChanged!(value);
                    }
                  },
                )
              else
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF910A19),
                  size: 18,
                ),
            ],
          ),
          onTap: widget.useToggle ? () {
            // Jika toggle di-tap lewat ListTile, ubah state toggle juga
            setState(() {
              _toggleValue = !_toggleValue;
            });
            if (widget.onToggleChanged != null) {
              widget.onToggleChanged!(_toggleValue);
            }
            if (widget.onTap != null) widget.onTap!();
          } : (widget.onTap ?? () {}),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        if (widget.showBorder)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          ),
      ],
    );
  }
}
