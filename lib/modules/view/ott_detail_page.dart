import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_app/modules/model/mirror_model.dart';

class ott_detail_page extends StatefulWidget {
  const ott_detail_page({super.key});

  @override
  State<ott_detail_page> createState() => _ott_detail_pageState();
}

class _ott_detail_pageState extends State<ott_detail_page> {
  late InAppWebViewController inAppWebViewController;
  late PullToRefreshController pullToRefreshController;

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(color: Colors.red),
      onRefresh: () {
        inAppWebViewController.reload();
      },
    );
  }

  Widget build(BuildContext context) {
    mirrorwallmodel modeldata =
        ModalRoute.of(context)!.settings.arguments as mirrorwallmodel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffBC9798),
        title: Text(
          modeldata.names,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InAppWebView(
            pullToRefreshController: pullToRefreshController,
            initialUrlRequest: URLRequest(
              url: WebUri(modeldata.links),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              setState(() {
                inAppWebViewController = controller;
              });
            },
            onLoadStop: (controller, uri) async {
              await pullToRefreshController.endRefreshing();
            },
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffBC9798).withOpacity(0.5),
                borderRadius: BorderRadius.circular(30)),
            height: 50,
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    if (await inAppWebViewController.canGoBack()) {
                      await inAppWebViewController.goBack();
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await inAppWebViewController.reload();
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await inAppWebViewController.loadUrl(
                      urlRequest: URLRequest(
                        url: WebUri(modeldata.links),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
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
                              const TextField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
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
                                onPressed: () {},
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
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (await inAppWebViewController.canGoForward()) {
                      await inAppWebViewController.goForward();
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
