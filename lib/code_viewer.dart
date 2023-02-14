library code_viewer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'code_snippet/list_of_keywords.dart';

class CodeViewer extends StatefulWidget {
  final String codeTohighlight;
  final String clipboard;
  final Color backgroundColor;
  final TextStyle commentStyle;
  final TextStyle stringStyle;
  final TextStyle numStyle;
  final TextStyle keywordStyle;
  final TextStyle punctuationStyle;
  final TextStyle basicStyle;
  final Icon icon;

  const CodeViewer({Key? key,

    this.codeTohighlight = '''//Thank you for downloading my package
    while (yourHeartBeat) {
  spreadLove();
}
        ''',
    this.clipboard = 'copy the code',
    this.backgroundColor = Colors.black,
    this.basicStyle = const TextStyle(color: Colors.white),
    this.commentStyle = const TextStyle(color: Colors.white60),
    this.stringStyle = const TextStyle(color: Colors.green),
    this.numStyle = const TextStyle(color: Colors.green),
    this.keywordStyle = const TextStyle(color: Colors.red),
    this.punctuationStyle = const TextStyle(color: Colors.amber),
    this.icon = const Icon(
      Icons.copy_all_rounded,
      color: Colors.white,
    ),
  }) : super(key: key);

  @override
  State<CodeViewer> createState() => _CodeViewerState();
}

class _CodeViewerState extends State<CodeViewer> {
  List editedCode = <InlineSpan>[];
  List<InlineSpan> children = [];

  RegExp regComment = RegExp(
    r'(//)+.*',
  );
  RegExp regsemi = RegExp(r'[,;]');
  RegExp regOfString = RegExp(r"""\'+.+\'|\".+\" """);
  RegExp regOfNum = RegExp(r'\d');
  RegExp regOfKeyWords = RegExp(r'');

  String patternConcanecator() {
    StringBuffer patternsAsString = StringBuffer();
    StringBuffer keywordsAsString = StringBuffer();

    keywordsAsString.writeAll(listOfKeywords, "|");
    regOfKeyWords = RegExp(keywordsAsString.toString());

    patternsAsString.writeAll([
      regComment.pattern,
      regOfString.pattern,
      regsemi.pattern,
      regOfNum.pattern,
      regOfKeyWords.pattern,
    ], '|');

    return patternsAsString.toString();
  }

  @override
  void initState() {
    for (var i = 0; i < listOfKeywords.length; i++) {
      listOfKeywords[i] = '''\\b${listOfKeywords[i]}\\b''';
    }

    widget.codeTohighlight.splitMapJoin(
      RegExp(patternConcanecator()),
      onMatch: (Match match) {
        if (regComment.hasMatch(match[0]!)) {
          children.add(TextSpan(
              text: match[0], style: widget.commentStyle));
          return '';
        }
        if (regOfString.hasMatch(match[0]!)) {
          children.add(TextSpan(
              text: match[0], style:widget.stringStyle));
          return '';
        }
        if (regsemi.hasMatch(match[0]!)) {
          children.add(TextSpan(
              text: match[0],
              style: widget.punctuationStyle));
          return '';
        }

        if (regOfKeyWords.hasMatch(match[0]!)) {
          children.add(TextSpan(
              text: match[0], style: widget.keywordStyle));
          return '';
        }
        if (regOfNum.hasMatch(match[0]!)) {
          children.add(TextSpan(
              text: match[0], style: widget.numStyle));
          return '';
        }

        return '';
      },
      onNonMatch: (String text) {
        children.add(
            TextSpan(text: text, style: widget.basicStyle));
        return '';
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, left: 20, bottom: 20),
                      child: SingleChildScrollView(
                        child: Text.rich(                               TextSpan(children: children),


                          textWidthBasis: TextWidthBasis.longestLine,
                            style:  const TextStyle(
                                letterSpacing: 2,
                                fontFamily: 'Roboto',
                                fontSize: 18),

                           ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        Clipboard.setData(
                            ClipboardData(text: widget.codeTohighlight));
                      },
                      icon: widget.icon,
                      tooltip: widget.clipboard,
                      splashColor: Colors.red,
                    )
                  ],
                ))));
  }
}
