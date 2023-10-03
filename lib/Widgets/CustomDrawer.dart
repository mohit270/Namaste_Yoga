import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:namaste_yoga/Screens/SplashScreen.dart';
import 'package:namaste_yoga/services/localdb.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  Future<void> shareApp() async {
    await FlutterShare.share(
        title: 'Hey I am using Yoga For Beginners App',
        text:
            'Hey I am using Namaste Yoga App. It has best yoga workout for all age groups. You should try it once.',
        linkUrl: 'https://flutter.dev/',
        chooserTitle: 'Example Chooser Title');
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/logo/sidedraver.jpeg"))),
          ),
          ListTile(
            title: Text(
              user!.email.toString(),
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.share,
              size: 25,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              "Reset Progress",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.restart_alt_sharp,
              size: 25,
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text('RESET PROGRESS'),
                        actionsAlignment: MainAxisAlignment.center,
                        actionsPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        content: const Text(
                            'This will reset all of your fitness data including Total Workout Time, Streak and Burned Calories. The action cannot be revert once done.'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 35))),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await LocalDB.setWorkOutTime(0);
                              await LocalDB.setkcal(0);
                              await LocalDB.setStreak(0);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SplashScreen()));
                            },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(
                                        vertical: 18, horizontal: 35))),
                            child: const Text(
                              "Reset",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ));
            },
          ),
          ListTile(
            title: const Text(
              "Share With Friends",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.share,
              size: 25,
            ),
            onTap: shareApp,
          ),
          ListTile(
            title: const Text(
              "Sign out",
              style: TextStyle(fontSize: 18),
            ),
            leading: const Icon(
              Icons.share,
              size: 25,
            ),
            onTap: signOut,
          ),
          const Divider(
            thickness: 2,
            endIndent: 30,
            indent: 30,
          ),
          const Text(
            "Version 1.0.0",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
