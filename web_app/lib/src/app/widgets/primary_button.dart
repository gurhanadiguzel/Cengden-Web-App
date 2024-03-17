import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_app/src/app/constants.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final List<Function()>? onPressedFunctions;
  final bool isEnabled;
  final bool isLoading;

  PrimaryButton({
    required this.text,
    required this.onPressedFunctions,
    required this.isEnabled,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: (size.width - 40) / 4,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isEnabled ? kPrimaryColor : kPrimaryColorHint,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        child: Container(
          alignment: Alignment.center,
          width: (size.width - 40) / 2,
          height: 56,
          child: isLoading
              ? CircularProgressIndicator(
                  color: kWhite,
                )
              : Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
        ),
        onPressed: () {
          if (isEnabled) {
            for (Function() onPressed in onPressedFunctions!) {
              onPressed();
            }
            HapticFeedback.lightImpact();
          }
        },
      ),
    );
  }
}
