import 'package:flutter/material.dart';
import 'package:gallery/main.dart';
import 'package:get/get.dart';

class FullScreen extends StatelessWidget {
  Controller controller = Get.put(Controller());

  var photoUrl;
  dynamic user;
  FullScreen({this.photoUrl, this.user});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Center(child: Text(controller.titleText)),
        ),
        body: Container(
          color: Colors.white,
          child: Hero(
              tag: 'full',
              child: Column(
                children: [
                  user.avatar == null
                      ? Container(): Container(
                    height: MediaQuery.of(context).size.height / 1.6,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(photoUrl),
                            fit: BoxFit.fitWidth)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('ID: ${user.id}'),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'name: ${user.firstName}  ${user.lastName}'),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('email: ${user.email}'),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
