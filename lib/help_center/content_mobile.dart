import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:taccb/remote_config.dart';

class ContentMobile extends StatelessWidget {
  const ContentMobile({
    super.key,
    required this.content,
    required this.headerText,
  });

  final Map<String, Map<String, String>> content;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Text(
            'KLIKJOB HELP CENTER',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          width: MediaQuery.of(context).size.width,
          child: Text.rich(
            TextSpan(
              text: headerText,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ' <${RemoteConfig.supportEmail ?? "-"}>',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        for (int i = 0; i < content.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpandablePanel(
              header: Text(
                content.keys.elementAt(i),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              collapsed: const SizedBox.shrink(),
              expanded: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    for (int j = 0; j < content.values.elementAt(i).length; j++)
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              content.values.elementAt(i).keys.elementAt(j),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Text(
                            content.values.elementAt(i).values.elementAt(j),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
