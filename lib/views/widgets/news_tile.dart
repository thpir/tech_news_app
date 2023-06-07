import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsTile extends StatelessWidget {
  const NewsTile(
      {required this.points,
      required this.title,
      required this.url,
      super.key});

  final int points;
  final String title;
  final String? url;

  Future<void> _launchUrl() async {
    if (url != null) {
      final Uri link = Uri.parse(url!);

      if (!await launchUrl(
        link,
        mode: LaunchMode.inAppWebView)) {
        throw Exception('Could not launch $url');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Text(points.toString()),
        title: Text(title),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          // Navigate to the second screen using a named route.
          //Navigator.pushNamed(context, '/detail');
          _launchUrl();
        },
      ),
    );
  }
}
