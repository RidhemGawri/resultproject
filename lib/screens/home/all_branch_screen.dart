import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resultproject/config/config.dart';
import 'package:resultproject/screens/home/Signup_screen.dart';
import 'package:resultproject/screens/home/roll_number_screen.dart';


import '../../admin/screens/admin_home_page.dart';
import '../../widgets/logout_dialogue.dart';

class AllBranchScreen extends StatelessWidget {
  const AllBranchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await dialogBox(context);
        return shouldPop!;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fill,
              )),
            ),
            title: const Text("All Branches"),
            actions: [
              PopupMenuButton(
                onSelected: (value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                       // const AdminHomePage(),
                      ));
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Text("Sign in as Admin"),
                  ),
                ],
                elevation: 2,
              ),
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: 5,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RollNumberScreen(branch: branches[index]),
                            ));
                      },
                      child: BuildCard(
                        text: branches[index],
                        fullname: fullname[index],
                      ));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List branches = ["CSE", "MECHANICAL", "ECE", "CIVIL", "ECM"];
List fullname = [
  "COMPUTER SCIENCE AND ENGINEERING",
  "MECHANICAL ENGINEERING",
  "ELECTRONICS AND COMMUNICATION ENGINEERING",
  "CIVIL ENGINEERING",
  "ELECTRONICS AND COMPUTER ENGINEERING"
];

class BuildCard extends StatelessWidget {
  String text;
  String fullname;

  BuildCard({Key? key, required this.text, required this.fullname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wsize = MediaQuery.of(context).size.width;
    final hsize = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: hsize*0.5,
        // width: wsize*0.45,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0, // soften the shadow
              spreadRadius: -2.0, //extend the shadow
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: GoogleFonts.lato(
                    color: AppConfig.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: wsize * 0.05)),
            Center(
                child: Text(
              fullname,
              style: GoogleFonts.lato(fontSize: wsize * 0.035),
              textAlign: TextAlign.center,
            )),
          ],
        ),
      ),
    );
  }
}
