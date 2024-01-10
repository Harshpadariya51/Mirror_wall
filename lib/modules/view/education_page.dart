import 'package:flutter/material.dart';
import 'package:mirror_wall_app/modules/provider/mirror_wall_provider.dart';
import 'package:mirror_wall_app/modules/view/education_detail_page.dart';
import 'package:provider/provider.dart';

class Education_page extends StatelessWidget {
  const Education_page({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<mirrorwallprovider>(context).getData();
    return Container(
      color: const Color(0xffBC9798),
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Color(0xffBC9798),
            floating: true,
            snap: true,
            title: Text(
              "Educational",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ...Provider.of<mirrorwallprovider>(context).mirrorlist.map(
                  (e) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                education_detail_page(url: e.link),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        shadowColor: const Color(0xffC2D0C1),
                        elevation: 10,
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: const Color(0xffC2D0C1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(e.img),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    e.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
