import 'package:flutter/material.dart';
import 'package:mirror_wall_app/modules/provider/mirror_wall_provider.dart';
import 'package:provider/provider.dart';

class ott_page extends StatefulWidget {
  const ott_page({super.key});

  @override
  State<ott_page> createState() => _ott_pageState();
}

class _ott_pageState extends State<ott_page> {
  @override
  Widget build(BuildContext context) {
    Provider.of<mirrorprovider>(context).getData();
    return Container(
      color: const Color(0xffBC9798),
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: const Color(0xffBC9798),
            floating: true,
            snap: true,
            title: Text(
              "OTT",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ...Provider.of<mirrorprovider>(context).mirrorwalllist.map(
                  (e) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed('ott_detail_page', arguments: e);
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
                                  child: Image.asset(e.image),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    e.names,
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
          )
        ],
      ),
    );
  }
}
