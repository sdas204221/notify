import 'dart:math';

class ChannelController {
  static List<String> getAllChannelId() {
    List<String> channelIds = [];
    for (int i = 0; i < 100; i++) {
      channelIds.add(i.toString());
    }
    return channelIds;
  }

  static String getNameById(String channelId) {
    return "$channelId number Channel";
  }

  static List<String> getNoticeIdsByChannelId(String channelId) {
    List<String> notices = [];
    for (int i = 0; i < 100; i++) {
      notices.add(i.toString());
    }
    return notices;
  }

  static String getChannelDescriptionByChannelId(String channelId) {
    return channelId * 50;
  }

  static String getRecentNoticeByChannelId(String channelId) {
    return "Last message of $channelId number Channel";
  }

  static String getRecentNoticeTimeByChannelId(String channelId) {
    return "${Random().nextInt(23) + 1}:${Random().nextInt(49) + 10}";
  }

  static int getSubscriberCountByChannelId(String channelId) {
    return int.parse(channelId) * 5657;
  }
}
