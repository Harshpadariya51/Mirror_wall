import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_app/modules/provider/mirror_wall_provider.dart';
import 'package:provider/provider.dart';

// class education_detail_page extends StatefulWidget {
//   final String url;
//   const education_detail_page({super.key, required this.url});
//
//   @override
//   State<education_detail_page> createState() => _education_detail_pageState();
// }
//
// class _education_detail_pageState extends State<education_detail_page> {
//   late InAppWebViewController inAppWebViewController;
//   late PullToRefreshController pullToRefreshController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     pullToRefreshController = PullToRefreshController(
//       settings: PullToRefreshSettings(color: Colors.red),
//       onRefresh: () {
//         inAppWebViewController.reload();
//       },
//     );
//   }
//
//   Widget build(BuildContext context) {
//     mirrormodel mirrormodeldata =
//         ModalRoute.of(context)!.settings.arguments as mirrormodel;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xffBC9798),
//         title: Text(
//           mirrormodeldata.name,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SafeArea(
//         child: Consumer<mirrorwallprovider>(
//           builder: (context, mirrorwallprovider, child) {
//             return Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 InAppWebView(
//                   pullToRefreshController: pullToRefreshController,
//                   initialUrlRequest: URLRequest(
//                     url: WebUri(mirrormodeldata.link),
//                   ),
//                   onWebViewCreated: (InAppWebViewController controller) {
//                     setState(() {
//                       inAppWebViewController = controller;
//                     });
//                   },
//                   onLoadStop: (controller, uri) async {
//                     await pullToRefreshController.endRefreshing();
//                   },
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                       color: const Color(0xffBC9798).withOpacity(0.8),
//                       borderRadius: BorderRadius.circular(30)),
//                   height: 50,
//                   margin: const EdgeInsets.all(20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       IconButton(
//                         icon: const Icon(
//                           Icons.arrow_back_ios,
//                           color: Colors.black,
//                         ),
//                         onPressed: () {
//                           Provider.of<mirrorwallprovider>(context,
//                                   listen: false)
//                               .goBack();
//                         },
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           Provider.of<mirrorwallprovider>(context,
//                                   listen: false)
//                               .reloadWeb();
//                         },
//                         icon: const Icon(
//                           Icons.refresh,
//                           color: Colors.black,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           Provider.of<mirrorwallprovider>(context,
//                                   listen: false)
//                               .goHome(url);
//                         },
//                         icon: const Icon(
//                           Icons.home,
//                           color: Colors.black,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           showDialog(
//                             context: (context),
//                             builder: (context) {
//                               return AlertDialog(
//                                 backgroundColor: const Color(0xffBC9798),
//                                 title: const Text("Add Bookmark"),
//                                 content: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     const TextField(
//                                       onSubmitted: (val) {
//                                         mirrorwallprovider
//                                             .textControllerModel.titleTxt;
//                                       },
//                                       controller: mirrorwallprovider
//                                           .textControllerModel.titleTxt,
//                                       keyboardType: TextInputType.text,
//                                       decoration: InputDecoration(
//                                         hintText: 'Name',
//                                         border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.all(
//                                             Radius.circular(10),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     OutlinedButton(
//                                       onPressed: () {},
//                                       child: const Text("Done"),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                         icon: const Icon(
//                           Icons.bookmark_border,
//                           color: Colors.black,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           Provider.of<mirrorwallprovider>(context,
//                                   listen: false)
//                               .goForward();
//                         },
//                         icon: const Icon(
//                           Icons.arrow_forward_ios,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class education_detail_page extends StatelessWidget {
  final String url;
  const education_detail_page({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    // mirrormodel mirrormodeldata =
    //     ModalRoute.of(context)!.settings.arguments as mirrormodel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffBC9798),
        title: const Text(
          "Web View",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Consumer<mirrorwallprovider>(
          builder: (context, Mirrorwallprovider, child) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(
                    url: WebUri(url),
                  ),
                  onWebViewCreated: (InAppWebViewController controller) {
                    Mirrorwallprovider.WebViewController(controller);
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffBC9798).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(30)),
                  height: 50,
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Provider.of<mirrorwallprovider>(context,
                                  listen: false)
                              .goBack();
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<mirrorwallprovider>(context,
                                  listen: false)
                              .reloadWeb();
                        },
                        icon: const Icon(
                          Icons.refresh,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<mirrorwallprovider>(context,
                                  listen: false)
                              .goHome(url);
                        },
                        icon: const Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: (context),
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: const Color(0xffBC9798),
                                title: const Text("Add Bookmark"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      onSubmitted: (val) {
                                        Mirrorwallprovider
                                            .textControllerModel.titleTxt;
                                      },
                                      controller: Mirrorwallprovider
                                          .textControllerModel.titleTxt,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        hintText: 'Name',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        Provider.of<mirrorwallprovider>(context,
                                                listen: false)
                                            .addbookmark(url);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Done"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<mirrorwallprovider>(context,
                                  listen: false)
                              .goForward();
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
