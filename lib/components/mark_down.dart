import 'package:coding_with_itmc/components/web_view.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

Widget buildMarkdown(BuildContext context, String data) {
  return SizedBox(
    height: 200,
    child: MarkdownWidget(
      data: data,
      styleConfig: StyleConfig(
          pConfig: PConfig(
            onLinkTap: (url) {
              _openInWebView(context, url);
            },
            textStyle: TextStyle(
              fontSize: 15,
            ),
          ),
          markdownTheme: MarkdownTheme.lightTheme,
          preConfig: PreConfig(language: 'cpp'),
          imgBuilder: (String url, attributes) {
            if (url.startsWith("resources:"))
              return Image.asset(url.substring("resources:".length));
            else
              return Image.network(url);
          }),
    ),
  );
}

void _openInWebView(BuildContext context, String url) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => WebViewContainer(url)));
}
