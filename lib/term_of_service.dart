import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:taccb/contents/tos_en.dart';
import 'package:taccb/contents/tos_id.dart';
import 'package:taccb/theme.dart';

class TermOfService extends StatefulWidget {
  const TermOfService({super.key});

  @override
  State<TermOfService> createState() => _TermOfServiceState();
}

class _TermOfServiceState extends State<TermOfService> {
  bool isEN = true;
  @override
  Widget build(_) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Text(
            isEN
                ? 'COLLARBEAR Term of Service'
                : 'Syarat dan Ketentuan COLLARBEAR',
            style: const TextStyle(
              color: secondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => setState(() => isEN = !isEN),
                  child: Text(
                    isEN ? "EN" : 'ID',
                    style: const TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.language, color: secondaryColor),
                  onPressed: () => setState(() => isEN = !isEN),
                ),
              ],
            ),
          ],
        ),
        body: Markdown(
          styleSheet: MarkdownStyleSheet(
            textAlign: WrapAlignment.spaceBetween,
            pPadding: const EdgeInsets.all(8),
            p: const TextStyle(),
          ),
          data: isEN ? tosEN : tos,
        ),
      );
}
