import 'package:anchor_scroll_controller/anchor_scroll_controller.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:taccb/remote_config.dart';

class ContentDesktop extends StatefulWidget {
  const ContentDesktop({
    super.key,
    required this.content,
    required this.headerText,
  });

  final Map<String, Map<String, String>> content;
  final String headerText;

  @override
  State<ContentDesktop> createState() => _ContentDesktopState();
}

class _ContentDesktopState extends State<ContentDesktop> {
  late final AnchorScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = AnchorScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView(
            children: [
              for (int i = 0; i < widget.content.length; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpandablePanel(
                    header: Text(
                      widget.content.keys.elementAt(i),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    collapsed: const SizedBox.shrink(),
                    expanded: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          for (int j = 0;
                              j < widget.content.values.elementAt(i).length;
                              j++)
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(8),
                                  width: MediaQuery.of(context).size.width,
                                  child: TextButton(
                                    onPressed: () {
                                      _scrollController.scrollToIndex(
                                        index: widget.content.values
                                                .take(i)
                                                .fold(
                                                    0,
                                                    (previousValue, element) =>
                                                        previousValue +
                                                        element.length) +
                                            j,
                                        curve: Curves.decelerate,
                                        scrollSpeed: 4,
                                      );
                                    },
                                    child: Container(
                                      width: double.maxFinite,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        widget.content.values
                                            .elementAt(i)
                                            .keys
                                            .elementAt(j),
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: ListView(
            controller: _scrollController,
            children: [
              for (int i = 0; i < widget.content.length; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
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
                            text: widget.headerText,
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          widget.content.keys.elementAt(i),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      for (int j = 0;
                          j < widget.content.values.elementAt(i).length;
                          j++)
                        AnchorItemWrapper(
                          index: widget.content.values.take(i).fold(
                                  0,
                                  (previousValue, element) =>
                                      previousValue + element.length) +
                              j,
                          controller: _scrollController,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  widget.content.values
                                      .elementAt(i)
                                      .keys
                                      .elementAt(j),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                              Text(
                                widget.content.values
                                    .elementAt(i)
                                    .values
                                    .elementAt(j),
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
