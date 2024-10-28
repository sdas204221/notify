import 'package:intl/intl.dart';
import 'package:notify/controllers/notice_controller.dart';
import 'package:notify/services/api/channel_api_service.dart';
import 'package:notify/services/db/channel_db_service.dart';

class ChannelController {
  String? userName;
  String? sessionToken;

  ChannelController() {
    try {
      userName = ChannelDbService.getUserName();
      sessionToken = ChannelDbService.getSessionToken();
    } catch (dbException) {
      //TODO Logout user
      throw Exception("faild to get Username from local DB");
    }
  }

  List<String> getAllChannelIds() {
    List<String> channelIds;
    try {
      channelIds = ChannelApiService.getAllChannelIds(userName!, sessionToken!);
      ChannelDbService.updateAllChannelId(channelIds);
    } catch (apiException) {
      try {
        channelIds = ChannelDbService.getAllChannelId();
      } catch (dbException) {
        throw Exception("Failed to get channel IDs from both API and local DB");
      }
    }
    return channelIds;
  }

  static String getChannelName(String channelId) {
    String channelName;
    try {
      channelName = ChannelDbService.getChannelName(channelId);
    } catch (e) {
      channelName = ChannelApiService.getChannelName(channelId);
      ChannelDbService.setChannelName(channelId, channelName);
    }
    return channelName;
  }

  static int getLastNoticeId(String channelId) {
    int lastNoticeId;
    try {
      lastNoticeId = ChannelDbService.getLastNoticeId(channelId);
    } catch (e) {
      lastNoticeId = ChannelApiService.getLastNoticeId(channelId);
      ChannelDbService.setLastNoticeId(channelId, lastNoticeId);
    }
    return lastNoticeId;
  }

  static void updateLastNoticeIds() {
    //TODO implement method
    return;
  }

  static void updateLastNoticeId(String channelId) {
    //TODO implement method
    return;
  }

  static String getChannelDescription(String channelId) {
    String channelDescription;
    try {
      channelDescription = ChannelDbService.getChannelDescription(channelId);
    } catch (e) {
      channelDescription = ChannelApiService.getChannelDescription(channelId);
      ChannelDbService.setChannelDescription(channelId, channelDescription);
    }
    return channelDescription;
  }

  static String getRecentNoticeByChannelId(String channelId) {
    return NoticeController.getNoticeBody(
        getLastNoticeId(channelId).toString(), channelId);
  }

  static String getRecentNoticeTimeByChannelId(String channelId) {
    return DateFormat('yyyy/MM/dd\nHH:mm').format(
        NoticeController.getNoticeTime(
            getLastNoticeId(channelId).toString(), channelId));
  }

  static int getSubscriberCount(String channelId) {
    int subscriberCount;
    try {
      subscriberCount = ChannelApiService.getSubscriberCount(channelId);
      ChannelDbService.setSubscriberCount(channelId, subscriberCount);
    } catch (e) {
      subscriberCount = ChannelDbService.getSubscriberCount(channelId);
    }
    return subscriberCount;
  }
}
