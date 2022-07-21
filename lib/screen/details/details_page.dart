import 'package:flutter/material.dart';

import 'package:wallpaper_application/component/component.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage(
      {Key? key, required this.imgPath, required this.name, required this.mail})
      : super(key: key);
  final String imgPath;
  final String name;
  final String mail;
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
                                  size: 25,
                                  color: Colors.red,
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
                                  Text(
                                    widget.mail,
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
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
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onTap: () {
                                    _ApplyDialog(context);
                                  },
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

Future<void> _ApplyDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Apply Wallpaper'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {},
              child: const Text('Home Screen'),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: const Text('Lock Screen'),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: const Text('Both Screen'),
            ),
          ],
        );
      });
}

showAlertDialogApply(BuildContext context) {
  Widget bothButton = FlatButton(
    child: const Text('Both Screen'),
    onPressed: () {},
  );
  Widget homeButton = FlatButton(
    child: const Text('Home Screen'),
    onPressed: () {},
  );
  Widget lockButton = FlatButton(
    child: const Text('Lock Screen'),
    onPressed: () {},
  );

  AlertDialog alertApply = AlertDialog(
    title: const Text("Apply"),
    actions: [bothButton, homeButton, lockButton],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertApply;
      });
}
