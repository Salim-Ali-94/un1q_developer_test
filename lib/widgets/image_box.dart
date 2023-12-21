import "package:flutter/material.dart";
import "package:cached_network_image/cached_network_image.dart";


class ImageBox extends StatelessWidget {

  final double size;
  final String image;
  final Color colour;
  final bool network;
  const ImageBox({ super.key,
                   required this.size,
                   required this.colour,
                   required this.network,
                   required this.image });

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Container(width: size*screenWidth, height: size*screenWidth, padding: EdgeInsets.all(network ? 0 : 5), clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(color: colour, borderRadius: const BorderRadius.all(Radius.circular(10))),
                    child: network ? CachedNetworkImage(imageUrl: image, width: size*screenWidth, fit: BoxFit.cover) : Image.asset(image, width: size*screenWidth));

  }

}
