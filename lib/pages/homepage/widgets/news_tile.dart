import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String image;
  final String text;
  final String author;
  final String timeline;
  final VoidCallback onTap;

  const NewsTile(
      {super.key,
      required this.image,
      required this.text,
      required this.author,
      required this.timeline,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  '$image',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 8,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text('$author',
                        overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Flexible(
                    child: Text('$text',
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Row(
                    children: [
                      Text('$timeline',
                          style: Theme.of(context).textTheme.labelSmall),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
