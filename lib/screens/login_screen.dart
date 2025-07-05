import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/social_login_button.dart';
import 'registration_screen.dart';
import 'beranda.dart'; // pastikan nama file dan class sesuai

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 640;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            constraints: BoxConstraints(
              minHeight: screenHeight - MediaQuery.of(context).padding.top,
            ),
            child: Column(
              children: [
                // Main Content
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? screenWidth * 0.05 : 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 70),

                      // Welcome Title
                      const Text(
                        'Halo, Selamat Datang',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.welcomeTitle,
                      ),

                      const SizedBox(height: 13),

                      // Subtitle
                      const Text(
                        'Silahkan masuk untuk memulai',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.subtitle,
                      ),

                      const SizedBox(height: 49),

                      // Email Field
                      CustomTextField(
                        label: 'Email',
                        controller: _emailController,
                      ),

                      const SizedBox(height: 25),

                      // Password Field
                      CustomTextField(
                        label: 'Password',
                        isPassword: true,
                        controller: _passwordController,
                      ),

                      const SizedBox(height: 28),

                      // Login Button
                      CustomButton(
                        text: 'Login',
                        onPressed: () {
                          // Navigasi ke halaman Beranda
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Beranda(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 13),

                      // Divider with text
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppColors.greyOpacity,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Atau lanjutkan dengan',
                              style: AppTextStyles.dividerText,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppColors.greyOpacity,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 13),

                      // Google Sign In Button
                      SocialLoginButton(
                        text: 'Lanjutkan dengan Google',
                        iconPath: 'lib/assets/images/google_icon.png',
                        onPressed: () {
                          // Handle Google sign in
                        },
                      ),

                      const SizedBox(height: 13),

                      // Register Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Belum punya akun? ',
                            style: TextStyle(
                              fontFamily: AppTextStyles.fontFamily,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                              height: 22 / 13,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                  const RegisterScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontFamily: AppTextStyles.fontFamily,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primary,
                                height: 22 / 13,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
