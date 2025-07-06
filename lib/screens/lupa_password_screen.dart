import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LupaPasswordScreen extends StatefulWidget {
  const LupaPasswordScreen({Key? key}) : super(key: key);

  @override
  State<LupaPasswordScreen> createState() => _LupaPasswordScreenState();
}

class _LupaPasswordScreenState extends State<LupaPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  void _resetPassword() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) return;

    setState(() => _isLoading = true);
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email reset dikirim')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal mengirim email reset')),
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
        title: const Text('Lupa Password', style: TextStyle(fontFamily: 'Poppins')),
        backgroundColor: const Color(0xFF6A9CFD),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Masukkan email akun kamu, kami akan mengirim tautan reset:',
              style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _resetPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6A9CFD),
              ),
              child: Text(_isLoading ? 'Mengirim...' : 'Kirim Link Reset',
                  style: const TextStyle(fontFamily: 'Poppins')),
            ),
          ],
        ),
      ),
    );
  }
}
