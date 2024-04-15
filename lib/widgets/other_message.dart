import 'package:flutter/material.dart';

class OtherMessage extends StatelessWidget {
  const OtherMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
          color: colors.secondary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Hola mundo',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      const SizedBox(height: 5),
      _ImageBubble(),
    ]);
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // print(size);
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        // child: Image.network('https://yesno.wtf/assets/no/24-159febcfd655625c38c147b65e5be565.gif',
        child: Image.network('https://picsum.photos/250/300',
            width: size.width * 0.7, height: 150, fit: BoxFit.cover));
  }
}