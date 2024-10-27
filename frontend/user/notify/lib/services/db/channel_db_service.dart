//TODO: implement class
class ChannelDbService {
  static String getUserName() {
    return "admin";
  }

  static String getSessionToken() {
    return "";
  }

  static List<String> getAllChannelId() {
    return [];
  }

  static void updateAllChannelId(List<String> channelIds) {
    return;
  }

  static String getChannelName(String channelId) {
    throw Exception(
        "Channel with ID $channelId does not exist in the database.");
  }

  static void setChannelName(String channelId, String channelName) {
    return;
  }

  static int getLastNoticeId(String channelId) {
    throw Exception(
        "No notices for the channel with ID $channelId exist in the database.");
  }

  static void setLastNoticeId(String channelId, int lastNoticeId) {
    return;
  }

  static String getChannelDescription(String channelId) {
    throw Exception(
        "Description for the channel with ID $channelId dose note exist in the database.");
  }

  static void setChannelDescription(
      String channelId, String channelDescription) {}

  static int getSubscriberCount(String channelId) {
    return int.parse(channelId) * 5657;
  }

  static void setSubscriberCount(String channelId, int subscriberCount) {}
}
