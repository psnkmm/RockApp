import 'package:flutter/material.dart';
import 'package:rock_app/models/rock_model.dart';

const STONE = "stone";
const MINERAL = "mineral";

class DetailPage extends StatelessWidget {
  final RockModel rockModel;

  const DetailPage({Key? key, required this.rockModel}) : super(key: key);

  Widget testText(String textTitle, String textData, Color colors) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "${textTitle}  ",
              style: TextStyle(
                  color: colors,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  height: 1.5)),
          TextSpan(
              text: textData.isNotEmpty ? "$textData" : "",
              style: TextStyle(color: colors, fontSize: 14, height: 1.5))
        ])));

    // Text(text.isNotEmpty ? "$text" : "",
    //     style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201520),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        //"https://source.unsplash.com/random/",
                        rockModel.rockImage,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Opacity(
                        opacity: 0.7,
                        child: InkWell(
                          child: const CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  textColor: Colors.white,
                  title: Text(
                    rockModel.rockNameEn,
                    style: const TextStyle(
                        fontSize: 24, height: 2, color: Colors.blueAccent),
                  ),
                  subtitle: Row(
                    children: [
                      Text(
                        rockModel.rockNameTh + " ",
                        style: const TextStyle(
                            fontSize: 16, height: 1.5, color: Colors.indigoAccent),
                      ),
                      // const SizedBox(width: 80),
                    ],
                  ),
                ),

                testText("หมวดหมู่:", rockModel.rockCategory, Colors.grey),
                rockModel.rockType.contains(MINERAL)
                    ? testText("กลุ่มแร่:", "${rockModel.rockGroup}", Colors.grey)
                    : SizedBox(),
                const SizedBox(height: 16),
                const Text("ข้อมูล (Detail)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.5)),
                Container(
                  margin: EdgeInsets.only(top: 8, bottom: 16),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.blueGrey.withOpacity(0.3),
                    // margin: EdgeInsets.all(8),
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                          left: 12, top: 8, right: 8, bottom: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          rockModel.rockType.contains(MINERAL)
                              ? testText("พบในหิน:", "${rockModel.rockIn}", Colors.white)
                              : SizedBox(),
                          testText("รายละเอียด (Description):",
                              "${rockModel.rockDes}", Colors.white),
                          rockModel.rockType.contains(MINERAL)
                              ? testText("แหล่งที่พบ (Location):",
                                  "${rockModel.rockLocation}", Colors.white)
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),

                const Text("คุณสมบัติ (Physical Properties)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.5)),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.orange.withOpacity(0.2),
                    // margin: EdgeInsets.all(8),
                    child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                          left: 12, top: 8, right: 8, bottom: 8),
                      child: rockModel.rockType.contains(MINERAL)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                testText(
                                    "สูตรเคมี:", "${rockModel.rockChemical}", Colors.white),
                                testText("สี:", "${rockModel.rockColor}", Colors.white),
                                testText("สีผล:", "${rockModel.rockStreak}", Colors.white),
                                testText("ความแข็ง (Hardnees):",
                                    "${rockModel.rockHardness}", Colors.white),
                                testText("ระบบโครงสร้างผลึก (Crystal System):",
                                    "${rockModel.rockCrystal}", Colors.white),
                                testText(
                                    "รูปผลึกและมวลรวม (Crystal Forms and Aggregates):",
                                    "${rockModel.rockForms}", Colors.white),
                                testText("ความโปร่งแสง (Transparency):",
                                    "${rockModel.rockTrans}", Colors.white),
                                testText("ความถ่วงจำเพาะ (Specific Gravity):",
                                    "${rockModel.rockSpecific}", Colors.white),
                                testText("ความมันวาว (Luster):",
                                    "${rockModel.rockLuster}", Colors.white),
                                testText("แนวแตกเรียบ (Cleavage):",
                                    "${rockModel.rockCleavage}", Colors.white),
                                testText("รอยแตกโค้งเว้า:",
                                    "${rockModel.rockFracture}", Colors.white),
                                // testText("Acid Rest:", "${rockModel.rockAcid}"),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  testText(
                                      "สูตรเคมี:", "${rockModel.rockChemical}", Colors.white),
                                  SizedBox(height: 8),
                                ]),
                    ),
                  ),
                ),
                testText("ที่มา:", "${rockModel.rockImage}", Colors.white),
                SizedBox(height: 24),

                // Text("Acid Rest: ${rockModel.rockAcid}",
                //     style: TextStyle(color: Colors.white)),
                // const SizedBox(height: 8),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     ElevatedButton(
                //       onPressed: () {},
                //       child: const Text(
                //         "Oat Milk",
                //         style: TextStyle(color: Color(0xFF201520)),
                //       ),
                //       style: ElevatedButton.styleFrom(
                //         primary: const Color(0xFFEFE3C8),
                //         fixedSize: const Size(100, 40),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //       ),
                //     ),
                //     OutlinedButton(
                //       onPressed: () {},
                //       child: const Text(
                //         "Soy Milk",
                //         style: TextStyle(color: Color(0xFFEFE3C8)),
                //       ),
                //       style: OutlinedButton.styleFrom(
                //         fixedSize: const Size(100, 40),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         side: const BorderSide(
                //           color: Color(0xFFEFE3C8),
                //           width: 2,
                //         ),
                //       ),
                //     ),
                //     OutlinedButton(
                //       onPressed: () {},
                //       child: const Text(
                //         "Almond Milk",
                //         style: TextStyle(color: Color(0xFFEFE3C8)),
                //       ),
                //       style: OutlinedButton.styleFrom(
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         fixedSize: const Size(120, 40),
                //         side: const BorderSide(
                //           color: Color(0xFFEFE3C8),
                //           width: 2,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: ListTile(
      //   contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      //   textColor: Colors.white,
      //   title: const Text("Price"),
      //   subtitle: const Text(
      //     "\$249",
      //     style: TextStyle(
      //       fontSize: 22,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   trailing: ElevatedButton(
      //     child: const Text(
      //       "Buy Now",
      //       style: TextStyle(
      //         color: Color(0xFF201520),
      //         fontSize: 20,
      //       ),
      //     ),
      //     style: ElevatedButton.styleFrom(
      //       primary: const Color(0xFFEFE3C8),
      //       fixedSize: const Size(250, 50),
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(10),
      //       ),
      //     ),
      //     onPressed: () => Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => const CardPage(),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
