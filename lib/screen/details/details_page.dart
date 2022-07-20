import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper_application/component/component.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.imgPath, required this.name})
      : super(key: key);
  final String imgPath;
  final String name;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double cardHeight = (size.height - kToolbarHeight + 10) / 7;
    final double cardWidth = size.width - 30;
    return Scaffold(
      body: Hero(
        tag: widget.imgPath,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(widget.imgPath),
            fit: BoxFit.cover,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Card(
                semanticContainer: true,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.all(5),
                child: SizedBox(
                  width: cardWidth,
                  height: cardHeight,
                  child: Center(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              InkWell(
                                child: const Icon(
                                  Icons.favorite,
                                  size: 30,
                                ),
                                onTap: () {},
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      widget.name,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                    ),
                                  ),
                                  const Text(
                                    'pexels.com',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                              child: Row(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: kPrimaryColor,
                                child: InkWell(
                                  child: const Icon(
                                    Icons.wallpaper,
                                    size: 30,
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
