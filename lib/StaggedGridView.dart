// ignore: file_names
// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper/list.dart';
import 'package:transparent_image/transparent_image.dart';

class StaggedGridView extends StatefulWidget {
  const StaggedGridView({Key? key}) : super(key: key);

  @override
  _StaggedGridViewState createState() => _StaggedGridViewState();
}

class _StaggedGridViewState extends State<StaggedGridView> {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 12,
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: ClipRRect(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imageList[index],
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) {
         return StaggeredTile.count(1, index.isEven ? 1.2 : 1.8);
      },
    );
  }
}
