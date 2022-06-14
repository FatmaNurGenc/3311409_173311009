import 'dart:convert';

//List<SurecTakip> surecTakipFromJson(String str) => List<SurecTakip>.from(json.decode(str)); //.map((x) => SurecTakip.fromJson(x)));

List<SurecTakip> surecTakipFromJson(String str) => List<SurecTakip>.from(json.decode(str).map((x) => SurecTakip.fromJson(x)));

String surecTakipToJson(List<SurecTakip> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class SurecTakip {
  int id;
  String? konumu;
  DateTime gorusmeTarihi;
  String? firmaAdi;
  String? yetkilisi;
  String? telefon;
  String? grubu;
  String? aciklama;
  String? durumu;
   //DateTime sonrakiHatirlatmaTarihi;
   String? smsHatirlatma;
  int? sorumluKullaniciId;
   DateTime pbCreateDate;
   DateTime pbUpdateDate;
  int? pbCreateSubeId;
  int? pbUpdateSubeId;
  int? pbCreateUserId;
  int? pbUpdateUserId;
  String? altGrubu;

  SurecTakip(
    this.id,
    this.konumu,
    this.gorusmeTarihi,
    this.firmaAdi,
    this.yetkilisi,
    this.telefon,
    this.grubu,
    this.aciklama,
    this.durumu,
     // this.sonrakiHatirlatmaTarihi,
     this.smsHatirlatma,
    this.sorumluKullaniciId,
     this.pbCreateDate,
     this.pbUpdateDate,
    this.pbCreateSubeId,
    this.pbUpdateSubeId,
    this.pbCreateUserId,
    this.pbUpdateUserId,
    this.altGrubu,
  );
  Map<String, dynamic> toJson() => {
        "ID": id,
        "Konumu": konumuValues,
        "GorusmeTarihi": gorusmeTarihi.toIso8601String(),
        "FirmaAdi": firmaAdi,
        "Yetkilisi": yetkilisi,
        "Telefon": telefon,
        "Grubu": grubuValues,
        "Aciklama": aciklama,
        "Durumu": durumuValues,
      //  "SonrakiHatirlatmaTarihi": sonrakiHatirlatmaTarihi == null ? null : sonrakiHatirlatmaTarihi.toIso8601String(),
        "SMSHatirlatma": smsHatirlatma,
        "SorumluKullaniciID": sorumluKullaniciId,
        "pbCreateDate": pbCreateDate.toIso8601String(),
        "pbUpdateDate": pbUpdateDate.toIso8601String(),
        "pbCreateSubeID": pbCreateSubeId,
        "pbUpdateSubeID": pbUpdateSubeId,
        "pbCreateUserID": pbCreateUserId,
        "pbUpdateUserID": pbUpdateUserId,
        "AltGrubu": altGrubu,
    };
    
      static fromJson(x) {}
}

//enum AltGrubu { DIER, EMPTY, BAYI, SOSYAL_MEDYA, SAT_PAZARLAMA, WEB_LERI, MD_SATIS, DESTEK, MD_ORGANIZER, PROGRATIK, MUHASEBE, E_FATURA, TEKNIK_LER, LISANS, AR_GE, PRATIK_SENET, MODDAS, MD_OPERASYON, TOPLANT, ALT_GRUBU_E_FATURA, MD_MAL_SAYM, KODLAMA, MD_SEVKIYAT, MD_DEPO, RESTO_PRATIK, ALT_GRUBU, STAJYER, MD_ETIKET, TASARM_VIDEO, ALT_GRUBU_MODDAS, MD_MOBIL, ALT_GRUBU_SOSYAL_MEDYA, PURPLE_SOSYAL_MEDYA, PHOTOSHOP, FLUFFY_SOSYAL_MEDYA, ALT_GRUBU_PROGRATIK, MDM_OBIL, MODDAS_M_DEPO, AR_DESTEK, E_MUHTAHSIL, E_MUSTAHSIL, MD_WEB, ALT_GRUBU_BAYI, PURPLE_BAYI, PURPLE_E_FATURA, EITIM, PURPLE_MODDAS, ALT_GRUBU_WEB_LERI, ALT_GRUBU_EITIM, BETA_TEST, MTERI_ZIYARET, ORGANIZE, KBAL_KRTASIYE_COM, MD_MRP, MDM_RP, MD_SELUKLU, MD_LISANS, E_IRSALIYE, E_RSALIYE, MODDAS_WEB, FATURA, MD_SEVKIYAT2, MDM_SEVKIYAT, MD_SEVLIYAT, ALT_GRUBU_MD_SEVKIYAT, PURPLE_MD_SEVKIYAT, MD_SEVIYAT, STOK_SAYM, FLUFFY_MD_SEVKIYAT, TENTACLED_SOSYAL_MEDYA, TBITAK_PROJE, DASKEY, POSDAS, GENEL_LISTE, PRATIK_SAT, ASORTI }

final altGrubuValues = [
    " ",
    "bayi",
    "eğitim",
    "e-Fatura",
    "MD Sevkiyat",
    "MODDAS",
    "progratik",
    "sosyal Medya ",
    "web İşleri" ,
    "Çağrı Destek",
    "Ar-Ge",
    "Asorti",
    "Bayi",
    "Beta Test",
    "DASKEY",
    "Destek",
    "Diğer",
    "Eğitim",
    "E-Fatura",
    "E-Irsaliye",
    "E-Muhtahsil",
    "E-Mustahsil",
    "E-İrsaliye",
    "Fatura",
    "MdSevkiyat",
    "sosyal Medya",
    "Genel Liste",
    "İkbalKırtasiye.com",
    "Kodlama",
    "Lisans",
    "MDMObil",
    "MDMRp",
    "MDMSevkiyat",
    "MDDepo",
    "MDEtiket",
    "MDLisans",
    "MDMalSayım",
    "MDMobil",
    "MDMrp",
    // "MDOperasyon": AltGrubu.MD_OPERASYON,
    // "MDOrganizer ": AltGrubu.MD_ORGANIZER,
    // "MDSatis": AltGrubu.MD_SATIS,
    // "MDSelçuklu": AltGrubu.MD_SELUKLU,
    // "MDSeviyat": AltGrubu.MD_SEVIYAT,
    // "MDSevkiyat": AltGrubu.MD_SEVKIYAT,
    // "MDSevkiyat2": AltGrubu.MD_SEVKIYAT2,
    // "MDSevliyat": AltGrubu.MD_SEVLIYAT,
    // "MDWeb": AltGrubu.MD_WEB,
    // "Moddas": AltGrubu.MODDAS,
    // "ModdasMDepo": AltGrubu.MODDAS_M_DEPO,
    // "ModdasWeb": AltGrubu.MODDAS_WEB,
    // "Müşteri Ziyaret": AltGrubu.MTERI_ZIYARET,
    // "Muhasebe": AltGrubu.MUHASEBE,
    // "Organize": AltGrubu.ORGANIZE,
    // "photoshop": AltGrubu.PHOTOSHOP,
    // "POSDAS": AltGrubu.POSDAS,
    // "Pratik Satış": AltGrubu.PRATIK_SAT,
    // "Pratik Senet": AltGrubu.PRATIK_SENET,
    // "Progratik": AltGrubu.PROGRATIK,
    // "bayi ": AltGrubu.PURPLE_BAYI,
    // "e-fatura": AltGrubu.PURPLE_E_FATURA,
    // "MDSevkiyat ": AltGrubu.PURPLE_MD_SEVKIYAT,
    // "moddas": AltGrubu.PURPLE_MODDAS,
    // "SOSYAL MEDYA": AltGrubu.PURPLE_SOSYAL_MEDYA,
    // "RestoPratik": AltGrubu.RESTO_PRATIK,
    // "Satış & Pazarlama": AltGrubu.SAT_PAZARLAMA,
    // "Sosyal Medya": AltGrubu.SOSYAL_MEDYA,
    // "Stajyer": AltGrubu.STAJYER,
    // "StokSayım": AltGrubu.STOK_SAYM,
    // "Tasarım & Video": AltGrubu.TASARM_VIDEO,
    // "Tübitak Proje": AltGrubu.TBITAK_PROJE,
    // "Teknik İşler": AltGrubu.TEKNIK_LER,
    // "sosyal medya": AltGrubu.TENTACLED_SOSYAL_MEDYA,
    // "Toplantı": AltGrubu.TOPLANT,
    // "Web İşleri": AltGrubu.WEB_LERI
];

//enum Durumu { THE_01_NORMAL, THE_02_OK_YKSEK, THE_03_YKSEK, THE_04_ACIL, THE_05_HATA, EMPTY }

final durumuValues =[
    "",
    "01 - Normal",
    "02 - Çok Yüksek",
    "03 - Yüksek",
    "04 - Acil",
    "05 - Hata"
];

//enum Grubu { DIER, EMPTY, BAYI, SOSYAL_MEDYA, SAT_PAZARLAMA, WEB_LERI, DAS_POSDAS, DESTEK, DAS_CRM, DAS_PROGRATK, MUHASEBE_FINANS, DAS_MODDAS, TEKNIK_LER, LISANS, AR_GE, DAS_PRATK_SENET, TOPLANT, DAS_MD_MAL_SAYM, KODLAMA, DAS_MD_SEVKIYAT, DAS_MD_DEPO, GRUBU, STAJ_PROJE, DAS_MD_ETIKET, TASARM_VIDEO, DAS_MD_MOBIL, GRUBU_SOSYAL_MEDYA, PURPLE_SOSYAL_MEDYA, FLUFFY_SOSYAL_MEDYA, DAS_MOBIL_DEPO, AR_DESTEK, DAS_MD_WEB, GRUBU_BAYI, PURPLE_BAYI, EITIM, GRUBU_WEB_LERI, GRUBU_EITIM, BETA_TEST, MTERI_ZIYARET, ORGANIZE, DAS_MOBIL_MRP, DAS_KEY, DAS_MODDAS_WEB, DAS_MOBIL_SEVKIYAT, TENTACLED_SOSYAL_MEDYA, TBITAK_PROJE, TEST, MODDAS, DAS_ORGANIZER }

final grubuValues = [
    "Çağrı Destek",
    "Ar-Ge",
    "Bayi",
    // "Beta Test": Grubu.BETA_TEST,
    // "DAS-CRM": Grubu.DAS_CRM,
    // "DAS-Key": Grubu.DAS_KEY,
    // "DAS-MDDepo": Grubu.DAS_MD_DEPO,
    // "DAS-MDEtiket": Grubu.DAS_MD_ETIKET,
    // "DAS-MDMalSayım": Grubu.DAS_MD_MAL_SAYM,
    // "DAS-MDMobil": Grubu.DAS_MD_MOBIL,
    // "DAS-MDSevkiyat": Grubu.DAS_MD_SEVKIYAT,
    // "DAS-MDWeb": Grubu.DAS_MD_WEB,
    // "DAS-Mobil Depo": Grubu.DAS_MOBIL_DEPO,
    // "DAS-Mobil MRP": Grubu.DAS_MOBIL_MRP,
    // "DAS-Mobil Sevkiyat": Grubu.DAS_MOBIL_SEVKIYAT,
    // "DAS-MODDAS": Grubu.DAS_MODDAS,
    // "DAS-MODDAS WEB": Grubu.DAS_MODDAS_WEB,
    // "DAS-Organizer": Grubu.DAS_ORGANIZER,
    // "DAS-POSDAS": Grubu.DAS_POSDAS,
    // "DAS-PRATİK SENET": Grubu.DAS_PRATK_SENET,
    // "DAS-PROGRATİK": Grubu.DAS_PROGRATK,
    // "Destek": Grubu.DESTEK,
    // "Diğer": Grubu.DIER,
    // "Eğitim": Grubu.EITIM,
    // "": Grubu.EMPTY,
    // "sosyal Medya": Grubu.FLUFFY_SOSYAL_MEDYA,
    // "₺": Grubu.GRUBU,
    // "bayi": Grubu.GRUBU_BAYI,
    // "eğitim": Grubu.GRUBU_EITIM,
    // "sosyal Medya ": Grubu.GRUBU_SOSYAL_MEDYA,
    // "web İşleri": Grubu.GRUBU_WEB_LERI,
    // "Kodlama": Grubu.KODLAMA,
    // "Lisans": Grubu.LISANS,
    // "Moddas": Grubu.MODDAS,
    // "Müşteri Ziyaret": Grubu.MTERI_ZIYARET,
    // "Muhasebe & Finans": Grubu.MUHASEBE_FINANS,
    // "Organize": Grubu.ORGANIZE,
    // "bayi ": Grubu.PURPLE_BAYI,
    // "SOSYAL MEDYA": Grubu.PURPLE_SOSYAL_MEDYA,
    // "Satış & Pazarlama": Grubu.SAT_PAZARLAMA,
    // "Sosyal Medya": Grubu.SOSYAL_MEDYA,
    // "Staj Proje": Grubu.STAJ_PROJE,
    // "Tasarım & Video": Grubu.TASARM_VIDEO,
    // "Tübitak Proje": Grubu.TBITAK_PROJE,
    // "Teknik İşler": Grubu.TEKNIK_LER,
    // "sosyal medya": Grubu.TENTACLED_SOSYAL_MEDYA,
    // "Test": Grubu.TEST,
    // "Toplantı": Grubu.TOPLANT,
    // "Web İşleri": Grubu.WEB_LERI
];


//enum Konumu { TAMAMLAND, PTAL_EDILDI, BEKLEMEDE, DEVAM_EDIYOR, ZEL, ONAY_BEKLIYOR }

final konumuValues = [
    "Beklemede",
    "Devam Ediyor",
    "Onay Bekliyor",
    "İptal Edildi",
    "Tamamlandı",
    "Özel"
];

enum SmsHatirlatma { H }

final smsHatirlatmaValues = EnumValues({
    "H": SmsHatirlatma.H
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
