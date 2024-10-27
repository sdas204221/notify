import 'package:get_it/get_it.dart';
import 'package:notify/controllers/channel_controller.dart';

final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerSingleton<ChannelController>(ChannelController());
}
