import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraRealScreen extends StatefulWidget {
  const CameraRealScreen({Key? key}) : super(key: key);

  @override
  State<CameraRealScreen> createState() => _CameraRealScreenState();
}

class _CameraRealScreenState extends State<CameraRealScreen> {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();

      // Ambil kamera depan, kalau tidak ada ambil kamera pertama
      final frontCamera = _cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => _cameras.first,
      );

      _controller = CameraController(frontCamera, ResolutionPreset.high);
      await _controller!.initialize();

      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (!(_controller?.value.isInitialized ?? false)) return;

    try {
      final XFile file = await _controller!.takePicture();

      // Navigasi ke halaman preview foto
      Navigator.pushNamed(
        context,
        '/takefoto',
        arguments: file.path,
      );
    } catch (e) {
      debugPrint('Error taking picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _isCameraInitialized
          ? Stack(
        children: [
          CameraPreview(_controller!),

          // Tombol ambil gambar
          Positioned(
            bottom: 40,
            left: MediaQuery.of(context).size.width * 0.5 - 30,
            child: GestureDetector(
              onTap: _takePicture,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
            ),
          ),
        ],
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
