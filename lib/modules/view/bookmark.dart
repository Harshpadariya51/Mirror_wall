import 'package:flutter/material.dart';
import 'package:mirror_wall_app/modules/provider/mirror_wall_provider.dart';
import 'package:mirror_wall_app/modules/view/education_detail_page.dart';
import 'package:provider/provider.dart';

class bookmark extends StatelessWidget {
  const bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffBC9798),
      appBar: AppBar(
        backgroundColor: const Color(0xffBC9798),
        title: const Text("Book Mark"),
        centerTitle: true,
      ),
      body: ListView(
        children: Provider.of<mirrorwallprovider>(context).bookmarks.map(
          (e) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => education_detail_page(url: e.url),
                  ),
                );
              },
              child: Card(
                elevation: 8,
                margin: const EdgeInsets.all(10),
                child: Container(
                  color: const Color(0xffC2D0C1),
                  alignment: Alignment.center,
                  height: 45,
                  width: double.infinity,
                  child: Text(e.title),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
