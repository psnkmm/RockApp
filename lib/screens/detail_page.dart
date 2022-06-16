import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF201520),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        //"https://source.unsplash.com/random/",
                        "http://sinwanasup.com/wp-content/uploads/2019/01/แร่แคลไซต์.jpg",
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
                  title: const Text(
                    "Calcite",
                    style: TextStyle(
                      fontSize: 24,
                      height: 2,
                    ),
                  ),
                  subtitle: Row(
                    children: const [
                      Text(
                        "แคลไซต์ ",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(width: 30),
                      Text("สูตรเคมี: CaCo3",
                          style: TextStyle(
                              color: Colors.white, fontSize: 16, height: 1.5)),
                    ],
                  ),
                  // trailing: const Icon(
                  //   Icons.favorite_outlined,
                  //   color: Colors.red,
                  //   size: 30,
                  // ),
                ),
                const Text(
                    "พบในหิน: หินปูน (Limestone), หินชอล์ก (chalk), ทราเวอร์ทีน (Travertine)",
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 8),
                const Text(
                  "รายละเอียด (Description): พบได้ทั่วไปในหินชั้นและหินแปร โดยเฉพาะบริเวณที่มีหินปูน ในตัวหินปูนเองอาจมีสายแร่แคลไซต์ ตัดผ่านหรือตกผลึกใหม่เนื่องจากความร้อนหรือความดันกลายเป็นหินอ่อน นอกจากนี้ยังพบแคลไซต์ในโพรงของหินภูเขาไฟเช่นหินบะซอลต์ และพบเป็นแร่ที่อยู่ในแร่ชนิดอื่น เช่น ในแร่ Fluorite, quartz, barite,  galena, sulfur, biotite เป็นต้น",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                const Text(
                  "แหล่งที่พบ (Location): ในประเทศไทย พบทั่วไปในจังหวัดที่มีหินปูน ตั้งแต่เชียงรายจนถึงจังหวัดยะลา พบมากจังหวัด ลพบุรี สระบุรีจันทบุรี กาญจนบุรี ชุพร สุราษฎร์ธานี นครสวรรค์ และเพชรบุรี ต่างประเทศ พบมากที่ประเทศอังกฤษ จีน เม็กซิโก สหรัฐอเมริกา อิตาลี สเปน",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 8),
                const Text(
                    "สี: ขาว หรือไม่มีสี แต่ก็อาจจะมีสีอื่นๆ ได้ เช่น สีเทา แดง เขียว น้ำเงิน เหลือง ถ้ามี มลทินอื่นปะปน เช่น พวกไพไรต์ ทองแดง มาลาไคต์ เป็นต้น จะมีสีเปลี่ยนไป จากน้ำตาลไปจนกระทั่งมีสีดำ",
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 8),
                const Text("สีผล: ละเอียดสีขาวหรือสีดำ",
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 8),
                const Text("ความแข็ง (Hardnees): 3.5 - 4",
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 8),
                const Text("ระบบโครงสร้างผลึก (Crystal System): Hexagonal",
                    style: TextStyle(color: Colors.white)),
                const SizedBox(height: 8),

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
