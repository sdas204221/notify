class ChannelController {
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
}
