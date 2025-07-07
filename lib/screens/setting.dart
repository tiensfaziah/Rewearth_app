import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/profil_settings.dart';
import '../widgets/menu_item_widget_settings.dart';
import '../screens/login_screen.dart';
import '../screens/riwayat.dart';
import 'total_poin_screen.dart';
import 'ubah_password_screen.dart';
import 'lupa_password_screen.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = _auth.currentUser;
    if (user == null) return;

    final doc = await _firestore.collection('users').doc(user.uid).get();
    if (doc.exists) {
      final data = doc.data()!;
      _nameController.text = data['nama'] ?? '';
      _emailController.text = data['email'] ?? '';
      _phoneController.text = data['phone'] ?? '';
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _updateField(String field, String value) async {
    final user = _auth.currentUser;
    if (user == null) return;

    try {
      // Update Firestore
      await _firestore.collection('users').doc(user.uid).update({field: value});

      // Jika field email, update juga di Firebase Auth
      if (field == 'email') {
        await user.updateEmail(value);
      }
    } catch (e) {
      debugPrint("Gagal update $field: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Pengaturan',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const ProfileAvatarWidget(),
                  const SizedBox(height: 23),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Informasi Diri',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        height: 2.25,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),

                  // ✅ Nama
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => _updateField('nama', value),
                  ),
                  const SizedBox(height: 10),

                  // ✅ Nomor Telepon
                  TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Nomor Telepon',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => _updateField('phone', value),
                  ),
                  const SizedBox(height: 10),

                  // ✅ Email
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => _updateField('email', value),
                  ),
                  const SizedBox(height: 29),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Umum',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        height: 2.25,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),

                  MenuItemWidget(
                    iconPath: 'lib/assets/images/produkmu.png',
                    title: 'Produkmu',
                    onTap: () {
                      Navigator.pushNamed(context, '/produkmu');
                    },
                  ),
                  const SizedBox(height: 14),

                  MenuItemWidget(
                    iconPath: 'lib/assets/images/coinblack.png',
                    title: 'Total Poin',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const TotalPoinScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 14),

                  MenuItemWidget(
                    iconPath: 'lib/assets/images/riwayat.png',
                    title: 'Riwayat Transaksi',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RiwayatScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 21),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Keamanan',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        height: 2.25,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),

                  MenuItemWidget(
                    iconPath: 'lib/assets/images/ubah_password.png',
                    title: 'Ubah Password',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const UbahPasswordScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 14),

                  MenuItemWidget(
                    iconPath: 'lib/assets/images/lupa_password.png',
                    title: 'Lupa Password',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LupaPasswordScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 14),

                  GestureDetector(
                    onTap: () async {
                      await _auth.signOut();
                      if (!mounted) return;
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const Login()),
                            (route) => false,
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F1F1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.logout, size: 20, color: Colors.black),
                        ),
                        const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).padding.top + 10,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/profile',
                        (route) => false,
                  );
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}