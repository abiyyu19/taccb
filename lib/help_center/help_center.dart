import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:taccb/help_center/content_deskstop.dart';
import 'package:taccb/help_center/content_mobile.dart';
import 'package:taccb/help_id.dart';
import 'package:taccb/theme.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key, this.isEN});

  final bool? isEN;

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  bool isEN = true;
  final Map<String, Map<String, String>> contentID = {
    manajement: {
      register: registerContent,
      find: findContent,
      fee: feeContent,
      nonaktif: nonaktifContent,
      hapus: hapusContent,
    },
    about: {
      menjadi: menjadiContent,
      bijak: bijakContent,
      reject: rejectContent,
      mulai: mulaiContent,
      ranking: rankingContent,
    },
    order: {
      aman: amanContent,
      khusus: khususContent,
      promo: promoContent,
      revisi: revisiContent,
      aktif: aktifContent,
      setuju: setujuContent,
      ulasan: ulasanContent,
    }
  };

  final Map<String, Map<String, String>> contentEN = {
    manajementEN: {
      registerEN: registerContentEN,
      findEN: findContentEN,
      feeEN: feeContentEN,
      nonaktifEN: nonaktifContentEN,
      hapusEN: hapusContentEN,
    },
    aboutEN: {
      menjadiEN: menjadiContentEN,
      bijakEN: bijakContentEN,
      rejectEN: rejectContentEN,
      mulaiEN: mulaiContentEN,
      rankingEN: rankingContentEN,
    },
    orderEN: {
      amanEN: amanContentEN,
      khususEN: khususContentEN,
      promoEN: promoContentEN,
      revisiEN: revisiContentEN,
      aktifEN: aktifContentEN,
      setujuEN: setujuContentEN,
      ulasanEN: ulasanContentEN,
    }
  };
  @override
  void initState() {
    isEN = widget.isEN ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          'KLIKJOB Help Center',
          style: TextStyle(
            color: secondaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isEN = !isEN;
                  });
                },
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
                onPressed: () {
                  setState(() {
                    isEN = !isEN;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop ||
              sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ContentDesktop(
                content: isEN ? contentEN : contentID,
                headerText: isEN
                    ? 'For any questions related to Klikjob, please refer to our FAQ. For further assistance, contact us at'
                    : 'Anda dapat menemukan semua pertanyaan terkait Klikjob di sini. Untuk informasi lebih lanjut, silakan hubungi',
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ContentMobile(
              content: isEN ? contentEN : contentID,
              headerText: isEN
                  ? 'For any questions related to Klikjob, please refer to our FAQ. For further assistance, contact us at'
                  : 'Anda dapat menemukan semua pertanyaan terkait Klikjob di sini. Untuk informasi lebih lanjut, silakan hubungi',
            ),
          );
        },
      ),
    );
  }
}
