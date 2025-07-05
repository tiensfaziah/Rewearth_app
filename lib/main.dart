import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ✅ Import semua screen
import 'package:rewearth/screens/donasi_desc.dart';
import 'package:rewearth/screens/kameraTB.dart';
import 'package:rewearth/screens/kode_donasi.dart';
import 'package:rewearth/screens/profile.dart';
import 'package:rewearth/screens/riwayat.dart';
import 'package:rewearth/screens/login_screen.dart';
import 'package:rewearth/screens/beranda.dart';
import 'package:rewearth/screens/clothing_screen.dart';
import 'package:rewearth/screens/video.dart';
import 'package:rewearth/screens/kameraSR.dart'; // ✅ Tetap gunakan
import 'package:rewearth/screens/takefotoSR.dart'; // ✅ Tetap gunakan
import 'package:rewearth/screens/rincian_donasi.dart';
import 'package:rewearth/screens/verifSR.dart';
import 'package:rewearth/screens/takeback.dart';
import 'package:rewearth/screens/descTB.dart';
import 'package:rewearth/screens/kode_donasi2.dart';
import 'package:rewearth/widgets/kameraTB_widget.dart';
import 'package:rewearth/screens/kameraTB.dart';
import 'package:rewearth/screens/tantangan.dart';
import 'package:rewearth/screens/detail_tantangan.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ Status bar terlihat (bukan immersive mode)
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // ✅ Style status bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rewearth App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),

      // ✅ Halaman awal aplikasi
      home: const LoginScreen(),

      // ✅ Daftar navigasi antar halaman
      routes: {
        '/beranda': (context) => const Beranda(),
        '/clothing': (context) => const ClothingScreen(),
        '/video': (context) => const VideoScreen(),
        '/riwayat': (context) => const RiwayatScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/donasi_desc': (context) => const DonationDescriptionScreenSR(),
        '/donation_code': (context) => const DonationShippingCodeScreen(),
        '/kamera_sr': (context) => const KameraSRScreen(), // ✅ Tetap tersedia
        '/takefoto': (context) => const TakeFoto(),         // ✅ Navigasi ke preview foto palsu
        '/rincian_donasi': (context) => const DonationDetailsScreen(),
        '/verifikasi': (context) => const VerificationSuccessScreen(),
        '/takeback': (context) => const TakeBackScreen(),
        '/donasi_desc_uniqlo': (context) => const DonationDescriptionScreenUniqlo(),
        '/donasi': (context) => const DonationShippingCodeScreen2(),
        '/kamera_tb': (context) => const KameraTBScreen(),
        '/tantangan': (context) => const ChallengeScreen(),


      },
    );
  }
}
