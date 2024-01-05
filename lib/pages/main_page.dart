import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/footer_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Future<List<dynamic>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/artists_data.json');
    var data = await json.decode(response);
    List<dynamic> artists = data['artists'];
    List<dynamic> featuredArtists = artists.where((item) {
      return item['featured'] == true;
    }).toList();
    print(featuredArtists);
    return featuredArtists;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xffB00B29),
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              selected: true,
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('ATM'),
              selected: false,
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Deposit'),
              selected: false,
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xffB00B29),
      appBar: const CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double firstFoldHeight =
              MediaQuery.of(context).size.height * 0.9325153374;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Hero Image
                Container(
                  height: firstFoldHeight,
                  color: const Color(0xffB00B29),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height:
                            0.6134969325 * MediaQuery.sizeOf(context).height,
                        width: 0.5555555556 * MediaQuery.sizeOf(context).width,
                        child: Image.asset(
                          'assets/atm.png',
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          launchUrl(Uri.parse(
                              'https://app.tryspace.com/M6aiq2y/society-fine-art'));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            minimumSize: const Size(100, 60)),
                        child: const Text(
                          'Find ATM',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // 2. Press Carousel
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          'ACCECPTED IN',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      CarouselSlider(
                        items: [
                          'assets/press1.png',
                          'assets/press2.png',
                          'assets/press3.png',
                          'assets/press1.png',
                          'assets/press2.png',
                          'assets/press3.png',
                        ].map((pressImagePath) {
                          return Image.asset(pressImagePath);
                        }).toList(),
                        options: CarouselOptions(
                          height: constraints.maxWidth <= 600
                              ? firstFoldHeight * 0.2
                              : firstFoldHeight * 0.2,
                          autoPlay: true,
                          viewportFraction:
                              constraints.maxWidth <= 600 ? 0.2 : 0.2,
                          enableInfiniteScroll: false,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: firstFoldHeight,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.098 * MediaQuery.sizeOf(context).height,
                      ),
                      Container(
                        height:
                            0.3680981595 * MediaQuery.sizeOf(context).height,
                        width: 0.85 * MediaQuery.sizeOf(context).width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'assets/money.png',
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0.098 * MediaQuery.sizeOf(context).height,
                      ),
                      SizedBox(
                          width:
                              0.4861111111 * MediaQuery.sizeOf(context).width,
                          child: const Text(
                            "Your Trusted Partner for was cash and Bitcoin Solutions",
                            softWrap: true,
                            style: TextStyle(fontSize: 23),
                          ))
                    ],
                  ),
                ),
                // 3. Featured Artists
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: firstFoldHeight,
                  color: const Color(0xffB00B29),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.098 * MediaQuery.sizeOf(context).height,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 0.1041666667 *
                                MediaQuery.sizeOf(context).width),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "How Does BitCoin ATM’s Work?",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                              softWrap: true,
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            SizedBox(
                              height: 400,
                              child: ListView.builder(
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            FittedBox(
                                              fit: BoxFit.cover,
                                              child: CircleAvatar(
                                                child: Center(
                                                    child:
                                                        Text('${index + 1}')),
                                                radius: 20,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "Hellooo",
                                              softWrap: true,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // 4, Use the FooterWidget here
                FooterWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
