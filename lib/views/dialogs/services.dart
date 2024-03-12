import 'package:flutter/material.dart';
import 'package:app/core/design/app_image.dart';

import '../../features/home/investigations/bloc.dart';

class ServicesDialog extends StatelessWidget {
  final List<ServiceDetails> list;

  const ServicesDialog({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.all(24),
      children: [
        const Text(
          "Services information",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xff2662F0)),
        ),
        const SizedBox(height: 12),
        Text(
          "-" * 200,
          maxLines: 1,
          style: const TextStyle(color: Color(0xffA2C0D4)),
        ),
        const SizedBox(height: 12),
        ...List.generate(
          list.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // todo should this image change or will be cons for all services
                const AppImage(
                  "x_ray.svg",
                  height: 20,
                  width: 20,
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: Text(
                    list[index].name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff717171),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
