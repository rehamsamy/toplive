import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:toplive/core/resourses/color_manger.dart';

import '../constants/app_const.dart';

class ImageViewer extends StatefulWidget {
  String imageUrl;
  bool viewImg = false;

  ImageViewer({this.imageUrl = "", this.viewImg = false});

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return widget.viewImg
        ? GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HeroPhotoViewRouteWrapper(
                    tag: widget.imageUrl,
                    imageProvider: NetworkImage(
                      widget.imageUrl,
                    ),
                  ),
                ),
              );
            },
            child: Container(
              child: Hero(
                tag: widget.imageUrl,
                child: Image.network(
                  widget.imageUrl,
                  width: 200,
                  height: 200,
                  loadingBuilder: (_, child, chunk) => chunk != null
                      ? SizedBox(
                          width: 200,
                          height: 200,
                          child: const Center(child: Text("loading")))
                      : child,
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                widget.viewImg = true;
              });
            },
            child: Container(
              height: 200,
              width: 200,
              color: Colors.grey.withOpacity(0.7),
              child: Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(8),
                      child: const Text('View Image'))),
            ),
          );
  }
}

class HeroPhotoViewRouteWrapper extends StatelessWidget {
  const HeroPhotoViewRouteWrapper({
    this.imageProvider,
    this.tag = "",
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  final String tag;
  final ImageProvider? imageProvider;
  final Decoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            children: [
              PhotoView(
                imageProvider: imageProvider,
                backgroundDecoration: backgroundBoxDectoration,
                minScale: minScale,
                maxScale: maxScale,
                heroAttributes: PhotoViewHeroAttributes(tag: tag),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.grey.withOpacity(0.6),
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        'Image',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            color: ColorsManger.grey2,
                            fontFamily: 'SSTwo'),
                      ),
                      const Spacer(),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close_fullscreen,
                            color: ColorsManger.grey2,
                            size: 25,
                          )),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
