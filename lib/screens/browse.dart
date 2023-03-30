import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_downloader/services/web_services.dart';

class BrowserPage extends StatefulWidget {
  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  WebServices webServices = WebServices();

  final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://www.youtube.com'));

  bool isDownload = false;

  void checkDownload() async {
    if (await _controller.currentUrl() == 'https://m.youtube.com/') {
      setState(() {
        isDownload = false;
      });
    } else {
      setState(() {
        isDownload = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    checkDownload();
    return Scaffold(
      body: WebViewWidget(controller: _controller),
      floatingActionButton: isDownload
          ? FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: () async {
                final url = await _controller.currentUrl();
                final title = await _controller.getTitle();

                webServices.downloadVideo(url!, title!);
              },
              child: const Icon(Icons.download),
            )
          : Container(),
    );
  }
}
