import 'package:flutter/material.dart';
import 'package:app/core/design/app_image.dart';

import '../../../features/home/notifications/bloc.dart';

class ItemNotification extends StatelessWidget {
  final MyNotificationModel model;

  const ItemNotification({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8, top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 8,
              color: const Color(0xff142E6E).withOpacity(.1),
            )
          ],
          color: Colors.white),
      child: Row(
        children: [
          const SizedBox(width: 8),
          AppImage(
            model.image,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.title,style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff414D55)
              )),
              Text(model.body,style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: Color(0xff414D55)
              )),
              Text(model.regDate,style: const TextStyle(
                fontSize: 10,
                  fontWeight: FontWeight.w100,
                color: Color(0xff414D55)
              ),),
            ],
          ))
        ],
      ),
    );
  }
}
