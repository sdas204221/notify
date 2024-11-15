import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notify/controllers/notice_controller.dart';
import 'package:notify/views/widgets/channel/notice/tag.dart';

class Notice extends StatefulWidget {
  final String noticeId;
  final String channelId;

  const Notice({super.key, required this.noticeId, required this.channelId});

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  late List<String> noticeTags;
  @override
  void initState() {
    super.initState();
    noticeTags =
        NoticeController.getNoticeTags(widget.noticeId, widget.channelId);
  }

  @override
  Widget build(BuildContext context) {
    DateTime noticeTime =
        NoticeController.getNoticeTime(widget.noticeId, widget.channelId);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color:
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notice No: ${widget.noticeId}",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(DateFormat('yyyy/MM/dd').format(noticeTime)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(NoticeController.getNoticeBody(
                  widget.noticeId, widget.channelId)),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: List<Widget>.generate(
                          noticeTags.length,
                          (i) => Tag(
                                value: noticeTags[i],
                              )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
                  child: Text(DateFormat('HH:mm').format(noticeTime)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
