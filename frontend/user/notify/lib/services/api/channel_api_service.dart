import 'dart:math';

import 'package:flutter_lorem/flutter_lorem.dart';

//TODO: implement class
class ChannelApiService {
  static List<String> getAllChannelIds(String userName, String sessionToken) {
    List<String> channelIds = [];
    for (int i = 0; i < 50; i++) {
      channelIds.add(i.toString());
    }
    return channelIds;
  }

  static String getChannelName(String channelId) {
    return "$channelId number Channel";
  }

  static int getLastNoticeId(String channelId) {
    return 75;
  }

  static String getChannelDescription(String channelId) {
    int paragraphsLength = Random().nextInt(3) + 1;
    return lorem(
        paragraphs: paragraphsLength,
        words: paragraphsLength * (10 + Random().nextInt(40)));
  }

  static int getSubscriberCount(String channelId) {
    return int.parse(channelId) * 5657;
  }
}
