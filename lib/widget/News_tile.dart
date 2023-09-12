import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            "assets/general.png",
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        const Text(
          "Lorem ipsum sine dollar Lorem ipsum sine lkasmas dollar Lorem ipsum sine dollar Lorem ipsum sine dollar",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Lorem ipsum sine dollar Lorem ipsum sine lkasmas dollar Lorem ipsum sine dollar Lorem ipsum sine dollar",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
