import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleLinkWidget extends StatelessWidget {
  final String url;

  const ArticleLinkWidget({super.key, required this.url});

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);

    try {
      // This opens the browser externally
      final bool launched = await launchUrl(uri, mode: LaunchMode.platformDefault);

      if (!launched) {
        debugPrint('Could not launch $url');
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: const Text(
        "Read more...",
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
          fontSize: 16,
        ),
      ),
    );
  }
}
