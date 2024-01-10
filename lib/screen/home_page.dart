import 'package:flutter/material.dart';

class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffBC9798),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton(
            itemBuilder: (context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  child: const Text("Book Mark"),
                  onTap: () {
                    Navigator.of(context).pushNamed("bookmark");
                  },
                ),
              ];
            },
          ),
        ],
        backgroundColor: const Color(0xffBC9798),
        title: const Text(
          "Mirror Wall",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('Education_page');
            },
            child: Card(
              elevation: 8,
              shadowColor: const Color(0xffC2D0C1),
              margin: const EdgeInsets.all(20),
              child: Container(
                height: 310,
                decoration: BoxDecoration(
                  color: const Color(0xffC2D0C1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/img/educaton.png',
                      height: 250,
                      width: 250,
                    ),
                    const Text(
                      "EDUCATIONAL",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('ott_page');
            },
            child: Card(
              elevation: 8,
              shadowColor: const Color(0xffC2D0C1),
              margin: const EdgeInsets.all(20),
              child: Container(
                height: 310,
                decoration: BoxDecoration(
                  color: const Color(0xffC2D0C1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/img/ott.png',
                      height: 250,
                      width: 250,
                    ),
                    const Text(
                      "OTT",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('google_page');
            },
            child: Card(
              elevation: 8,
              shadowColor: const Color(0xffC2D0C1),
              margin: const EdgeInsets.all(20),
              child: Container(
                height: 310,
                decoration: BoxDecoration(
                  color: const Color(0xffC2D0C1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/img/search.png',
                      height: 250,
                      width: 200,
                    ),
                    const Text(
                      "Search Engine",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
