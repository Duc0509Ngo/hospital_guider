import 'package:flutter/material.dart';


class ContainerImage extends StatelessWidget {
  const ContainerImage({Key? key, required this.imageAssetPath})
      : super(key: key);
  final String imageAssetPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageAssetPath),
        ),
      ),
      
    );
  }
}
