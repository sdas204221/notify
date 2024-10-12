class ChannelController {
  static String getNameById(String id) {
    return "$id number Channel";
  }

  static List<String> getMessageIdsByChannelId(String id) {
    List<String> messages = [];
    for (int i = 0; i < 100; i++) {
      messages.add(i.toString());
    }
    return messages;
  }
}
