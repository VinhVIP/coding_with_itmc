import 'package:coding_with_itmc/components/web_view.dart';
import 'package:coding_with_itmc/config.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

Widget buildMarkdown(BuildContext context, String data) {
  return MarkdownWidget(
    data: data,
    styleConfig: StyleConfig(
        pConfig: PConfig(
          selectable: false,
          onLinkTap: (url) {
            _openInWebView(context, url);
          },
          textStyle: TextStyle(
            fontSize: 15,
            color: darkMode ? kTextDarkColor : kTextColor,
          ),
        ),
        markdownTheme:
            darkMode ? MarkdownTheme.darkTheme : MarkdownTheme.lightTheme,
        preConfig: PreConfig(
            language: 'c++',
            margin: EdgeInsets.only(right: 20),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
        imgBuilder: (String url, attributes) {
          if (url.startsWith("resources:"))
            return Image.asset(url.substring("resources:".length));
          else
            return Image.network(
              url,
              loadingBuilder: (context, child, loadingProgress) {
                if(loadingProgress == null) return child;
                else return Center(child: CircularProgressIndicator());
              },
            );
        }),
  );
}

void _openInWebView(BuildContext context, String url) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => WebViewContainer(url)));
}
