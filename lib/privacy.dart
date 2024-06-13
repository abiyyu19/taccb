import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:taccb/contents/content_en.dart';
import 'package:taccb/contents/content_id.dart';
import 'package:taccb/contents/privacy_en.dart';
import 'package:taccb/contents/privacy_id.dart';
import 'package:taccb/contents/top_en.dart';
import 'package:taccb/contents/top_id.dart';
import 'package:taccb/theme.dart';

class Privacy extends GetResponsiveView<PrivacyController> {
  Privacy({super.key});

  @override
  Widget builder() => Scaffold(
        drawer: Drawer(
          child: Obx(
            () => ListView(
              padding: const EdgeInsets.all(8),
              children: [
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.isEN.value
                          ? "TABLE OF CONTENTS"
                          : 'DAFTAR ISI',
                      style: const TextStyle(
                        color: secondaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                ...(controller.isEN.value
                        ? [
                            'Privacy Policy',
                            'Term of Payment',
                            'Intellectual Property Claims',
                            'Cookies Policy',
                            'Community Guidelines',
                            'Sanctions, Deactivation & Deletion of Account',
                          ]
                        : [
                            'Kebijakan Privasi',
                            'Syarat Ketentuan Pembayaran',
                            'Pelaporan Klaim Pelanggaran Hak Cipta',
                            'Kebijakan Kuki',
                            'Panduan Komunitas',
                            'Sanksi, Penonaktifan & Penghapusan Akun',
                          ])
                    .asMap()
                    .entries
                    .map((e) => ListTile(
                          onTap: () {
                            controller.tc.animateTo(e.key);
                            Get.back();
                          },
                          title: Text(e.value),
                        ))
                    .toList()
              ],
            ),
          ),
        ),
        key: controller.scaffoldKey,
        appBar: PreferredSize(
          preferredSize: screen.isPhone
              ? AppBar().preferredSize
              : Size(
                  AppBar().preferredSize.width,
                  AppBar().preferredSize.height +
                      const TabBar(tabs: []).preferredSize.height * 0.67,
                ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  offset: const Offset(0, 0.9),
                ),
              ],
            ),
            color: AppBar().backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    if (screen.isPhone)
                      IconButton(
                        icon: const Icon(Icons.menu, color: secondaryColor),
                        onPressed: () =>
                            controller.scaffoldKey.currentState!.openDrawer(),
                      ),
                    Expanded(
                      child: Obx(
                        () => Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            controller.isEN.value
                                ? "KLIKJOB's Legal Documents"
                                : 'Dokumen Hukum KLIKJOB',
                            style: const TextStyle(
                              color: secondaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => controller.isEN.toggle(),
                          child: Obx(
                            () => Text(
                              controller.isEN.value ? "EN" : 'ID',
                              style: const TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon:
                              const Icon(Icons.language, color: secondaryColor),
                          onPressed: () => controller.isEN.toggle(),
                        ),
                      ],
                    ),
                  ],
                ),
                if (!screen.isPhone)
                  Obx(() => TabBar(
                      labelColor: secondaryColor,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      indicatorColor: secondaryColor,
                      controller: controller.tc,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      tabs: controller.isEN.value
                          ? const [
                              Tab(text: 'Privacy Policies'),
                              Tab(text: 'Term of Payment'),
                              Tab(text: 'Intellectual Property Claims'),
                              Tab(text: 'Cookies Policies'),
                              Tab(text: 'Community Guidelines'),
                              Tab(
                                text:
                                    "Sanctions, Deactivation & Deletion of Account",
                              ),
                            ]
                          : [
                              const Tab(text: 'Kebijakan Privasi'),
                              const Tab(text: 'Syarat Ketentuan Pembayaran'),
                              const Tab(
                                text: 'Pelaporan Klaim Pelanggaran Hak Cipta',
                              ),
                              const Tab(text: 'Kebijakan Kuki'),
                              const Tab(text: 'Panduan Komunitas'),
                              const Tab(
                                text: 'Sanksi, Penonaktifan & Penghapusan Akun',
                              ),
                            ])),
              ],
            ),
          ),
        ),
        body: Obx(
          () => TabBarView(
              controller: controller.tc,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TabItem(
                  judul: controller.isEN.value
                      ? "Privacy Policies"
                      : 'Kebijakan Privasi',
                  content: controller.isEN.value ? privasiEN : privasi,
                ),
                TabItem(
                  judul: controller.isEN.value
                      ? "Terms of Payment"
                      : 'Syarat Ketentuan Pembayaran',
                  content: controller.isEN.value ? topEN : top,
                ),
                TabItem(
                  judul: controller.isEN.value
                      ? "Reporting Claims of Copyright Infringement"
                      : 'Pelaporan Klaim Pelanggaran Hak Cipta',
                  content: controller.isEN.value ? ipcEN : ipc,
                ),
                TabItem(
                  judul: controller.isEN.value
                      ? "Cookies Policies"
                      : 'Kebijakan Kuki',
                  content: controller.isEN.value ? cookiesEN : cookies,
                ),
                TabItem(
                  judul: controller.isEN.value
                      ? "Community Guideline"
                      : 'Panduan Komunitas',
                  content: controller.isEN.value ? cgEN : cg,
                ),
                TabItem(
                  judul: controller.isEN.value
                      ? "Sanctions, Deactivation & Deletion of Account"
                      : 'Sanksi, Penonaktifan & Penghapusan Akun',
                  content: controller.isEN.value ? accEN : acc,
                ),
              ]),
        ),
      );
}

class TabItem extends GetResponsiveView {
  TabItem({
    super.key,
    required this.judul,
    required this.content,
  });

  final String judul, content;
  @override
  Widget builder() => Column(children: [
        Container(
          width: screen.width,
          margin: const EdgeInsets.all(16),
          child: Text(
            judul,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Expanded(
          child: Markdown(
            styleSheet: MarkdownStyleSheet(
              textAlign: WrapAlignment.spaceBetween,
              pPadding: const EdgeInsets.all(8),
              p: const TextStyle(),
            ),
            data: content,
          ),
        ),
      ]);
}

class PrivacyController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RxBool isEN = true.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final TabController tc = TabController(length: 6, vsync: this);

  @override
  void dispose() {
    tc.dispose();
    super.dispose();
  }
}
