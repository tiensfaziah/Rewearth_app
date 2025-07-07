import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UbahPasswordScreen extends StatefulWidget {
  const UbahPasswordScreen({Key? key}) : super(key: key);

  @override
  State<UbahPasswordScreen> createState() => _UbahPasswordScreenState();
}

class _UbahPasswordScreenState extends State<UbahPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _ubahPassword() async {
    final newPassword = _passwordController.text.trim();
    if (newPassword.isEmpty || newPassword.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password harus minimal 6 karakter')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password berhasil diubah'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        String errorMessage = 'Gagal mengubah password';

        if (e.code == 'requires-recent-login') {
          errorMessage =
          'Demi keamanan, silakan login ulang terlebih dahulu lalu coba lagi.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Terjadi kesalahan'), backgroundColor: Colors.red),
        );
      }
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
        const Text('Ubah Password', style: TextStyle(fontFamily: 'Poppins')),
        backgroundColor: const Color(0xFF6A9CFD),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Masukkan password baru kamu:',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password Baru',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _ubahPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A9CFD),
              ),
              child: Text(_isLoading ? 'Memproses...' : 'Ubah Password',
                  style: const TextStyle(fontFamily: 'Poppins')),
            ),
          ],
        ),
      ),
    );
  }
}
