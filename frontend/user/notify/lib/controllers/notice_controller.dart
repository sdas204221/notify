import 'dart:math';

import 'package:flutter_lorem/flutter_lorem.dart';

class NoticeController {
  static DateTime getNoticeTime(String noticeId, String channelId) {
    int startDate = DateTime(2000, 1, 1).millisecondsSinceEpoch;
    int endDate = DateTime(2025, 1, 1).millisecondsSinceEpoch;
    Random random = Random();
    int timestamp =
        startDate + (random.nextDouble() * (endDate - startDate)).toInt();
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    //String formattedDate = DateFormat('yyyy/MM/dd HH:mm').format(dateTime);

    return dateTime;
  }

  static String getNoticeBody(String noticeId, String channelId) {
    int paragraphsLength = Random().nextInt(3) + 1;
    return lorem(
        paragraphs: paragraphsLength,
        words: paragraphsLength * (10 + Random().nextInt(40)));
  }

  static List<String> getNoticeTags(String noticeId, String channelId) {
    List<String> tags = List.generate(Random().nextInt(15) + 1, (index) {
      return lorem(paragraphs: 1, words: 1);
    });

    return tags;
  }
}
