import 'package:flutter/material.dart';
import 'package:kalshi/core/design/components/icon/kalshi_icon_data.dart';

class KalshiIcon extends StatelessWidget {
  const KalshiIcon(this.icon, {this.color, super.key});

  final KalshiIcons icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage('assets/icons/${icon.assetName}.png'),
      size: 24,
      color: color,
    );
  }
}
