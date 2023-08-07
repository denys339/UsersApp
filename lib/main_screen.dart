import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gallery/model/UsersModel.dart';
import 'package:http/http.dart' as http;
import 'full_screen.dart';
import 'package:get/get.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Controller controller = Get.put(Controller());
  getApiData() async {
    var url = Uri.parse('https://reqres.in/api/users?page=2');
    final res = await http.get(url);
    setState(() {
      controller.urlData = jsonDecode(res.body);
    });
  }

  @override
  void initState() {
    super.initState();
    getApiData();
  }
  SharedPreferences? prefs;
  String? getPrefs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: controller.urlData == null
          ? const CircularProgressIndicator()
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 250,
                    mainAxisSpacing: 30,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10),
                itemBuilder: (context, userListIndex) {

                  DocData users = DocData.fromJson(controller.urlData);
                  dynamic user = users.data?[userListIndex];
                  final userEncode = jsonEncode(user);

                  
                  sharedPreferences()async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString('user', userEncode);
                    setState(() {
                      getPrefs = prefs.getString('user');
                    });


                  }

                  sharedPreferences();
                  return InkWell(
                      onTap: () {
                        Get.to(FullScreen(
                          photoUrl: user.avatar.toString(),
                          user: user,
                        ));
                      },
                      child: Hero(
                        tag: 'dash',
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            user.avatar == null
                                ? Container()
                                : Image(image: NetworkImage(user.avatar)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'ID: ${user.id}\nname:${user.firstName}\nemail:\n${user.email}'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ));
                },
              ),
            ),
    );
  }
}
