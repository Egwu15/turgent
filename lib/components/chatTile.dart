import 'package:flutter/material.dart';

Widget chatTile({String image, String name, String message, String time}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      children: [
        Container(
          width: 80,
          height: 80,
          child: ClipOval(
            child: Image.network(
              image,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
          ),

        ),
        SizedBox(
          width: 11.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17.0),
            ),
            Text(
              message,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Spacer(),
        Text(time)
      ],
    ),
  );
}
