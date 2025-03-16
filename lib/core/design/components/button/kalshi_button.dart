import 'package:flutter/material.dart';
import 'package:kalshi/core/design/design.dart';

enum KalshiButtonType { primary, secondary }

class _KalshiButtonProps {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final KalshiCircularProgressIndicatorType loadingType;

  _KalshiButtonProps({
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    required this.loadingType,
  });
}

class KalshiButton extends StatelessWidget {
  const KalshiButton({
    required this.label,
    required this.onPressed,
    this.type = KalshiButtonType.primary,
    this.showLoading = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final KalshiButtonType type;
  final bool showLoading;
  @override
  Widget build(BuildContext context) {
    _KalshiButtonProps getButtonProps() {
      switch (type) {
        case KalshiButtonType.primary:
          return _KalshiButtonProps(
            backgroundColor: KalshiColors.brandSecondary,
            borderColor: Colors.transparent,
            textColor: KalshiColors.contentPure,
            loadingType: KalshiCircularProgressIndicatorType.secondary,
          );
        case KalshiButtonType.secondary:
          return _KalshiButtonProps(
            backgroundColor: KalshiColors.surfacePure,
            borderColor: KalshiColors.brandSecondary,
            textColor: KalshiColors.brandSecondary,
            loadingType: KalshiCircularProgressIndicatorType.primary,
          );
      }
    }

    final _KalshiButtonProps buttonProps = getButtonProps();

    return SizedBox(
      height: 56.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(96.0),
          ),
          side: BorderSide(color: buttonProps.borderColor, width: 2),
          backgroundColor: buttonProps.backgroundColor,
        ),
        child:
            showLoading
                ? KalshiCircularProgressIndicator(type: buttonProps.loadingType)
                : KalshiText(
                  label,
                  style: KalshiTextStyles.button,
                  color: buttonProps.textColor,
                ),
      ),
    );
  }
}
