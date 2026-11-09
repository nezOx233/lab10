
import 'package:flutter/material.dart';
import 'preview_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textController =
  TextEditingController(text: 'Demo');

  final TextEditingController _sizeController =
  TextEditingController(text: '24');

  Future<void> _showMessage(String message) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFFF7FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Image(
                image: NetworkImage(
                  'https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090',
                ),
                width: 40,
                height: 40,
              ),
              SizedBox(height: 8),
            ],
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _openPreview() async {
    final text = _textController.text;

    final fontSize = double.tryParse(
      _sizeController.text.replaceAll(',', '.'),
    );

    if (text.trim().isEmpty ||
        fontSize == null ||
        !fontSize.isFinite ||
        fontSize <= 0 ||
        fontSize > 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Enter text and a font size from 1 to 200',
          ),
        ),
      );
      return;
    }

    final result = await Navigator.push<PreviewResult>(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewScreen(
          text: text,
          fontSize: fontSize,
        ),
      ),
    );

    if (!mounted) return;

    String message;

    if (result == PreviewResult.ok) {
      message = 'Cool!';
    } else if (result == PreviewResult.cancel) {
      message = "Let's try something else.";
    } else {
      message = "Don't know what to say.";
    }

    await _showMessage(message);
  }

  @override
  void dispose() {
    _textController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text settings'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
              CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Text',
                    hintText: 'Enter text',
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: _sizeController,
                  keyboardType:
                  const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Font size',
                    hintText: 'Enter font size',
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                Center(
                  child: ElevatedButton(
                    onPressed: _openPreview,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xFF73549A),
                      foregroundColor: Colors.white,
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 14,
                      ),
                    ),
                    child: const Text('Preview'),
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
