
import 'package:flutter/material.dart';

enum PreviewResult {
  ok,
  cancel,
}

class PreviewScreen extends StatelessWidget {
  final String text;
  final double fontSize;

  const PreviewScreen({
    super.key,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 18),

              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        PreviewResult.ok,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color(0xFF73549A),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('OK'),
                  ),

                  const SizedBox(width: 12),

                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        PreviewResult.cancel,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor:
                      const Color(0xFF73549A),
                    ),
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
