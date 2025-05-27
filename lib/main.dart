import 'package:flutter/material.dart';
import 'package:puppy_scan/screens/home/home_screen.dart';
import 'package:puppy_scan/screens/home/scanning_screen.dart';
import 'package:puppy_scan/screens/paywall/paywall_screen.dart';
import 'package:puppy_scan/screens/results/results_screen.dart';
import 'package:puppy_scan/screens/slider/slider_screen.dart';
import 'package:puppy_scan/screens/splash/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'services/openai_service.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    const Sandbox(),
    // MaterialApp(
    //   routes: {
    //     '/': (context) => SplashScreen(),
    //     '/slider': (context) => SliderScreen(),
    //     '/paywall': (context) => PaywallScreen(),
    //     '/home': (context) => HomeScreen(),
    //     '/scanning': (context) => ScanningScreen(),
    //     '/results': (context) => ResultsScreen(),
    //   },
    // ),
  );
}

class Sandbox extends StatelessWidget {
  const Sandbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Image Generator',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const ImageGeneratorPage(),
    );
  }
}

class ImageGeneratorPage extends StatefulWidget {
  const ImageGeneratorPage({Key? key}) : super(key: key);

  @override
  State<ImageGeneratorPage> createState() => _ImageGeneratorPageState();
}

class _ImageGeneratorPageState extends State<ImageGeneratorPage> {
  final OpenAIService _openAIService = OpenAIService();
  final TextEditingController _promptController = TextEditingController();

  String? _imageUrl;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  Future<void> _generateImage() async {
    if (_promptController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Silakan masukkan deskripsi gambar';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final imageUrl = await _openAIService.generateImage(
        _promptController.text,
      );

      if (imageUrl.startsWith('Error:')) {
        setState(() {
          _errorMessage = imageUrl;
          _isLoading = false;
        });
      } else {
        setState(() {
          _imageUrl = imageUrl;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Terjadi kesalahan: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Image Generator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _promptController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi Gambar',
                hintText: 'Contoh: Kucing berwarna orange bermain di pantai',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _generateImage,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child:
                  _isLoading
                      ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                      : const Text('Generate Gambar'),
            ),
            const SizedBox(height: 20),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            if (_imageUrl != null && _errorMessage == null)
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      'Hasil Gambar:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          _imageUrl!,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Text(
                                'Gagal memuat gambar',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          },
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
