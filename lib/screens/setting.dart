import 'package:flutter/material.dart';
import '../widgets/profil_settings.dart';
import '../widgets/info_field_widget_settings.dart';
import '../widgets/menu_item_widget_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Pengaturan',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const ProfileAvatarWidget(),
              const SizedBox(height: 23),

              // Informasi Diri
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Informasi Diri',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 2.25,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              const InfoFieldWidget(label: 'Nama', value: 'El Timiji'),
              const SizedBox(height: 10),
              const InfoFieldWidget(label: 'Nomor Telepon', value: '08123456789'),
              const SizedBox(height: 10),
              const InfoFieldWidget(
                label: 'Email',
                value: 'eltimiji707197@gmail.com',
                isEmail: true,
              ),
              const SizedBox(height: 29),

              // Umum
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Umum',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 2.25,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              const MenuItemWidget(
                iconPath: 'lib/assets/images/produkmu.png',
                title: 'Produkmu',
              ),
              const SizedBox(height: 14),
              const MenuItemWidget(
                iconPath: 'lib/assets/images/coinblack.png',
                title: 'Total Poin',
              ),
              const SizedBox(height: 14),
              const MenuItemWidget(
                iconPath: 'lib/assets/images/riwayat.png',
                title: 'Riwayat Transaksi',
              ),

              const SizedBox(height: 21),

              // Keamanan
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Keamanan',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 2.25,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              const MenuItemWidget(
                iconPath: 'lib/assets/images/ubah_password.png',
                title: 'Ubah Password',
              ),
              const SizedBox(height: 14),
              const MenuItemWidget(
                iconPath: 'lib/assets/images/lupa_password.png',
                title: 'Lupa Password',
              ),
              const SizedBox(height: 14),
              const MenuItemWidget(
                iconPath: 'lib/assets/images/keamanan.png',
                title: 'Keamanan',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
