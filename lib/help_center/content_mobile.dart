import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ContentMobile extends StatelessWidget {
  const ContentMobile({
    super.key,
    required this.content,
  });

  final Map<String, Map<String, String>> content;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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