import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String tag;
  final String timeline;
  final String heading;
  final String author;
  final String image;
  final VoidCallback onTap;

  const TrendingCard(
      {super.key,
      required this.tag,
      required this.timeline,
      required this.heading,
      required this.author,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 8),
        // height: 380,
        width: 250,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: image,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Center(child: const Icon(Icons.error)),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$tag',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  '$timeline',
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Flexible(
                  child: Text('$heading',
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SizedBox(
                  width: 8,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                ),
                const SizedBox(
                  width: 4,
                ),
                Flexible(
                    child: Text('$author',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium))
              ],
            ),
            const SizedBox(height: 8)
          ],
        ),
      ),
    );
  }
}
