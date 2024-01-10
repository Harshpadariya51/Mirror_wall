import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_app/modules/provider/mirror_wall_provider.dart';
import 'package:provider/provider.dart';

class google_page extends StatelessWidget {
  const google_page({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<mirrorbrowsers>(context).getData();
    return Container(
      color: const Color(0xffBC9798),
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: const Color(0xffBC9798),
            title: Text(
              "Search Engines",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ...Provider.of<mirrorbrowsers>(context).mirrorwallbrowsers.map(
                  (e) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("search_detail_page", arguments: e);
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
                                  child: Image.asset(e.imag),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    e.namee,
                                    style: const TextStyle(
                                        fontSize: 22,
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

    // Scaffold(
    //   backgroundColor: const Color(0xffBC9798),
    //   appBar: AppBar(
    //     backgroundColor: const Color(0xffBC9798),
    //     title: const Text(
    //       "GOOGLE",
    //       style: TextStyle(fontWeight: FontWeight.bold),
    //     ),
    //   ),
    //   body: ListView(
    //     children: [
    //       InkWell(
    //         onTap: () {
    //           Navigator.of(context).pushNamed('search_detail_page');
    //         },
    //         child:
    //       ),
    //     ],
    //   ),
    // );
  }
}
