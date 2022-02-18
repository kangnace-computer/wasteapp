// ignore_for_file: use_key_in_widget_constructors, await_only_futures, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasteapp/constants/constants.dart';

class PersonPageL extends StatefulWidget {
  @override
  _PersonPageLState createState() => _PersonPageLState();
}

class _PersonPageLState extends State<PersonPageL> {
  final buildauth = FirebaseAuth.instance;
  final double coverHeight = 280;
  final double profileHeight = 144;
  late String email,name;

  @override
  void initState() {
    super.initState();
    findNameAnEmail();
  }

  Future<void> findNameAnEmail() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event!.displayName!;
          email = event.email!;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.settings),
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(Icons.person, color: Colors.green),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('Setting',
                              style: TextStyle(color: kTextColor)),
                        )
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    onTap: () async {
                      await Firebase.initializeApp().then((value) async {
                        await FirebaseAuth.instance.signOut().then((value) =>
                            Navigator.pushNamedAndRemoveUntil(context,
                                '/bottom_navigation', (route) => false));
                      });
                    },
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(Icons.exit_to_app, color: Colors.green),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('Logout',
                              style: TextStyle(color: kTextColor)),
                        )
                      ],
                    ),
                  ),
                ];
              })
        ],
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////
  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://scontent.fbkk2-4.fna.fbcdn.net/v/t1.6435-9/117645011_3374010155978851_5351920166548563958_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeHgqkBuFtOwxQDOYRMzzOnKcSJW2YUgWg1xIlbZhSBaDcwZc_RcgGm5_P-Ar1G3gFJiEHZkXKkzy3VdXvF8D1i5&_nc_ohc=kOY0C1tk-bcAX_uCxCg&_nc_ht=scontent.fbkk2-4.fna&oh=00_AT9Esra87-jmPXr1_MkGOGRi-fvW1nhMoeiNCQDdF8HjCQ&oe=621D5EC1',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(
          'https://scontent.fbkk2-4.fna.fbcdn.net/v/t39.30808-6/257647780_4705541312825722_3977967995678997749_n.jpg?_nc_cat=105&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeH99eE9jY63z4pi3PbMs1Z4d1U3JCyqFk53VTckLKoWTubSz_IcPrvpB0tHdp0pSQtt_e9Qe4eR3Cc3i6JbGiP9&_nc_ohc=u5zCG0UYd10AX-1rIAv&_nc_ht=scontent.fbkk2-4.fna&oh=00_AT_e9Q1YnUbYKADDILePZlu2KP_9sa7JVi4yR_H61HvQZQ&oe=61FB03AA',
        ),
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(height: 8),
          Text(
            email,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: TextStyle(fontSize: 20, color: Colors.black26),
          ),
          const SizedBox(height: 16),
          Divider(),
        ],
      );
}
