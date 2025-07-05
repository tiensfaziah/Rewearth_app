import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback? onPressed;

  const SocialLoginButton({
    Key? key,
    required this.text,
    required this.iconPath,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: AppColors.lightGrey,
          width: 1,
        ),
        color: AppColors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 57,
                height: 40,
                margin: const EdgeInsets.only(right: 8),
                child: Image.asset(
                  iconPath,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                text,
                style: AppTextStyles.socialButtonText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
