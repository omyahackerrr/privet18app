// main.dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Privet 18+',
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  void _openWebView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(
          initialUrl: 'https://xnxx.health/search/sex+videos',
        ),
      ),
    );
  }

  void _openTelegramGroup() async {
    const url = 'https://t.me/+Np7BNIGmBoQwZjJl';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Join Telegram First', style: TextStyle(color: Colors.white, fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _openTelegramGroup();
                _openWebView(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: Text('Join & Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  final String initialUrl;
  WebViewScreen({required this.initialUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privet 18+')), 
      body: WebView(
        initialUrl: initialUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
