import 'package:rock_app/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201520),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          //search bar
          sliverAppBar(context),
          SliverPadding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.035,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF362C36),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  //"https://source.unsplash.com/random/$index",
                                  "http://sinwanasup.com/wp-content/uploads/2019/01/แร่แคลไซต์.jpg",
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          // const Text(
                          //   "Calcite",
                          //   style: TextStyle(color: Colors.white),
                          // ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF463D46),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(4.0),
                            child: Row(
                              children: const [
                                Spacer(),
                                Text(
                                  "Calcite \nแคลไซต์ ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.center,
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailPage(),
                      ),
                    ),
                  );
                },
                childCount: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar sliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: MediaQuery.of(context).size.height * 0.0,
      toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      title: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "ยินดีต้อนรับเข้าสู่",
            //   style: TextStyle(
            //     color: const Color(0xFF83796F),
            //     fontSize: MediaQuery.of(context).size.height * 0.033,
            //   ),
            // ),
            // Text(
            //   "หินนะ",
            //   style: TextStyle(
            //     color: const Color(0xFFEFE3C8),
            //     fontSize: MediaQuery.of(context).size.height * 0.035,
            //   ),
            // ),
          ],
        ),
      ),
      actions: [
        // Container(
        //   height: MediaQuery.of(context).size.width * 0.15,
        //   width: MediaQuery.of(context).size.width * 0.15,
        //   margin: EdgeInsets.only(
        //     right: MediaQuery.of(context).size.width * 0.05,
        //     top: MediaQuery.of(context).size.height * 0.01,
        //   ),
        //   decoration: BoxDecoration(
        //     color: const Color(0xFFF3CA90),
        //     shape: BoxShape.circle,
        //     border: Border.all(
        //       width: MediaQuery.of(context).size.height * 0.002,
        //       color: const Color(0xFFF3CA90),
        //     ),
        //     image: const DecorationImage(
        //       image: NetworkImage("https://source.unsplash.com/random"),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
      ],
      bottom: PreferredSize(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: const Color(0xFF171017),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                ),
                child: const Icon(
                  Icons.search,
                  color: Color(0xFF83796F),
                ),
              ),
              const Text(
                "ค้นหาหินแร่...",
                style: TextStyle(color: Color(0xFF83796F)),
              ),
            ],
          ),
        ),
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.00,
        ),
      ),
    );
  }
}
