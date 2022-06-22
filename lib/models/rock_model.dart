// class RockList {
//   RockList({
//     required this.rockList,
//   });
//
//   List<RockModel> rockList;
//
//
//   RockList.fr
//
// // factory RockList.fromJson(Map<String, dynamic> json) => RockList(
// //   rockList: rockList.from(json.map((data) => RockModel.fromJson(data))),
// // );
// }

class RockModel {
  String id;
  String rockLuster;
  String rockTrans;
  String rockChemical;
  String rockColor;
  String rockCleavage;
  String rockLocation;
  String rockNameTh;
  String rockImage;
  String rockDes;
  String rockFracture;
  String rockSpecific;
  String rockNameEn = "";
  String rockIn;
  String rockCrystal;
  String rockHardness;
  String rockForms;
  String rockStreak;
  String rockGroup;
  String rockCategory;
  String rockType;
  String rockAcid = "";

  RockModel(
      {required this.id,
        required this.rockLuster,
        required this.rockTrans,
        required this.rockChemical,
        required this.rockColor,
        required this.rockCleavage,
        required this.rockLocation,
        required this.rockNameTh,
        required this.rockImage,
        required this.rockDes,
        required this.rockFracture,
        required this.rockSpecific,
        required this.rockNameEn,
        required this.rockIn,
        required this.rockCrystal,
        required this.rockHardness,
        required this.rockForms,
        required this.rockStreak,
        required this.rockCategory,
        required this.rockGroup,
        required this.rockType,
        required this.rockAcid,

      });

  factory RockModel.fromJson(Map<String, dynamic> json) => RockModel(
      id: json['id'],
      rockLuster: json['rockLuster'],
      rockTrans: json['rockTrans'],
      rockChemical: json['rockChemical'],
      rockColor: json['rockColor'],
      rockCleavage: json['rockCleavage'],
      rockLocation: json['rockLocation'],
      rockNameTh: json['rockNameTh'],
      rockImage: json['rockImage'],
      rockDes: json['rockDes'],
      rockFracture: json['rockFracture'],
      rockSpecific: json['rockSpecific'],
      rockNameEn: json['rockNameEn'] ?? "",
      rockIn: json['rockIn'],
      rockCrystal: json['rockCrystal'],
      rockHardness: json['rockHardness'],
      rockForms: json['rockForms'],
      rockStreak: json['rockStreak'],
      rockGroup: json['rockGroup'],
      rockType: json['rockType'],
      rockCategory: json['rockCategory'],
      rockAcid: json['rockAcid'] ?? ""

  );

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data:new Map<String, dynamic>();
//   data['id']:this.id;
//   data['rockLuster']:this.rockLuster;
//   data['rockTrans']:this.rockTrans;
//   data['rockChemical']:this.rockChemical;
//   data['rockColor']:this.rockColor;
//   data['rockCleavage']:this.rockCleavage;
//   data['rockLocation']:this.rockLocation;
//   data['rockNameTh']:this.rockNameTh;
//   data['rockImage']:this.rockImage;
//   data['rockDes']:this.rockDes;
//   data['rockFracture']:this.rockFracture;
//   data['rockSpecific']:this.rockSpecific;
//   data['rockNameEn']:this.rockNameEn;
//   data['rockIn']:this.rockIn;
//   data['rockCrystal']:this.rockCrystal;
//   data['rockHardness']:this.rockHardness;
//   data['rockForms']:this.rockForms;
//   data['rockSteak']:this.rockSteak;
//   return data;
// }
}
