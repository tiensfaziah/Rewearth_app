import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
import 'package:rewearth/screens/kameraSR.dart';
import 'package:rewearth/screens/takefotoSR.dart';
import 'package:rewearth/screens/verifSR.dart';
import 'package:rewearth/screens/takeback.dart';
import 'package:rewearth/screens/descTB.dart';
import 'package:rewearth/screens/kode_donasi2.dart';
import 'package:rewearth/screens/kirimSR.dart';
import 'package:rewearth/screens/takefotoTB.dart';
import 'package:rewearth/screens/setting.dart';
import 'package:rewearth/screens/camera_real_screen.dart';
import 'package:rewearth/screens/notif.dart';
import 'package:rewearth/screens/chat.dart';
import 'package:rewearth/screens/chatpemilik.dart';
import 'package:rewearth/screens/tantangan.dart';
import 'package:rewearth/screens/detail_tantangan.dart';
import 'package:rewearth/screens/produkmu.dart';
import 'package:rewearth/screens/total_poin_screen.dart';
import 'screens/ubah_password_screen.dart';
import 'screens/lupa_password_screen.dart';

// ✅ Import halaman onboarding
import 'package:rewearth/screens/boarding.dart';

// ✅ Import halaman yang butuh arguments
import 'package:rewearth/screens/takefotoSR.dart';
import 'package:rewearth/screens/rincian_donasi.dart';
import 'screens/kategori_baju_screen.dart';
import 'screens/kategori_celana_screen.dart';
import 'screens/kategori_kain_screen.dart';
import 'screens/kategori_rok_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

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

      // ✅ Halaman awal: onboarding
      home: const OnboardingScreen(
        imageAsset: 'lib/assets/images/logoAPK.png',
      ),

      // ✅ Route normal (tanpa arguments)
      routes: {
        '/login': (context) => const Login(),
        '/beranda': (context) => const Beranda(),
        '/clothing': (context) => const ClothingScreen(),
        '/video': (context) => const VideoScreen(),
        '/riwayat': (context) => const RiwayatScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/donasi_desc': (context) => const DonationDescriptionScreenSR(),
        '/donation_code': (context) => const DonationShippingCodeScreen(),
        '/kamera_sr': (context) => const KameraSRScreen(),
        '/verifikasi': (context) => const VerificationSuccessScreen(),
        '/takeback': (context) => const TakeBackScreen(),
        '/donasi_desc_uniqlo': (context) => const DonationDescriptionScreenUniqlo(),
        '/donasi': (context) => const DonationShippingCodeScreen2(),
        '/kamera_tb': (context) => const KameraTBScreen(),
        '/tantangan': (context) => const ChallengeScreen(),
        '/produkmu': (context) => const ProductListingScreen(),
        '/kirimSR': (context) => const CaraMengirimBarangScreen(),
        '/TakeBack': (context) => const TakeBackScreen(),
        '/takefotoTB': (context) => const TakeFotoTB(),
        '/Settings': (context) => const Settings(),
        '/camerareal': (context) => const CameraRealScreen(),
        '/notif': (context) => const notifScreen(),
        '/chat': (context) => const chatScreen(),
        '/chatpemilik': (context) => const ChatPemilik(),
        '/totalpoin': (context) => const TotalPoinScreen(),
        '/ubahpassword': (context) => const UbahPasswordScreen(), // ✅
        '/lupapassword': (context) => const LupaPasswordScreen(), // ✅
        '/kategori-baju': (context) => const KategoriBajuScreen(),
        '/kategori-celana': (context) => const KategoriCelanaScreen(),
        '/kategori-kain': (context) => const KategoriKainScreen(),
        '/kategori-rok': (context) => const KategoriRokScreen(),

      },

      // ✅ Route dengan arguments
      onGenerateRoute: (settings) {
        // → halaman preview setelah kamera asli
        if (settings.name == '/takefoto') {
          final imagePath = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => TakeFoto(imagePath: imagePath),
          );
        }

        // → halaman rincian donasi (pakai gambar hasil kamera)
        if (settings.name == '/rincian_donasi') {
          final imagePath = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => DonationDetailsScreen(imagePath: imagePath),
          );
        }

        return null;
      },
    );
  }
}
