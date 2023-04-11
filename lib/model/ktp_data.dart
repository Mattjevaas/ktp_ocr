class KtpData {
  final String? nik;
  final String? name;
  final String? birthPlace;
  final String? bloodType;
  final String? birthDate;
  final String? gender;
  final String? address;
  final String? rt;
  final String? rw;
  final String? district;
  final String? subDistrict;
  final String? religion;
  final String? marriageStatus;
  final String? job;
  final String? citizenship;
  final String? validUntil;
  final String? province;
  final String? city;

  const KtpData({
    required this.nik,
    required this.name,
    required this.birthPlace,
    required this.bloodType,
    required this.birthDate,
    required this.gender,
    required this.address,
    required this.rt,
    required this.rw,
    required this.district,
    required this.subDistrict,
    required this.religion,
    required this.marriageStatus,
    required this.job,
    required this.citizenship,
    required this.validUntil,
    required this.province,
    required this.city,
  });

  Map<String, dynamic> toJson() => {
        "nik": nik,
        "name": name,
        "birthPlace": birthPlace,
        "bloodType": bloodType,
        "birthDate": birthDate,
        "gender": gender,
        "address": address,
        "rt": rt,
        "rw": rw,
        "district": district,
        "subDistrict": subDistrict,
        "religion": religion,
        "marriageStatus": marriageStatus,
        "job": job,
        "citizenship": citizenship,
        "validUntil": validUntil,
        "province": province,
        "city": city,
      };
}
