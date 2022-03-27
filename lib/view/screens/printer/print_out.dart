import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class ReceiptPrintOut extends StatelessWidget {
  const ReceiptPrintOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebViewPlus(
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          controller.loadString(r"""
           <html lang="en">
            <body>hello world</body>
           </html>
      """);
        },
      ),
    );
  }
}
