import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:moddas_mobil_app_deneme/pages/organizer/organizer_liste.dart';

class KayitBilgileri extends StatefulWidget {
  const KayitBilgileri({Key? key}) : super(key: key);

  @override
  State<KayitBilgileri> createState() => _KayitBilgileriState();
}

class _KayitBilgileriState extends State<KayitBilgileri> {
  TextEditingController _islemAciklamasi = new TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  int currentIndex = 0;

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
    time = TimeOfDay.now();
  }

  late TimeOfDay time;
  final maskFormatter = MaskTextInputFormatter(mask: '(###) ###-##-##');
  final grup = [
    ' ',
    'Ar-Ge',
    'Bayi',
    'Beta Test',
    'DAS-Key',
    'DAS-MDDepo',
    'DAS-MDEtiket',
    'DAS-MDMalSayım',
    'DAS-MDMobil',
    'DAS-MDSevkiyat',
    'DAS-MDWeb',
    'DAS-Mobil',
    'DAS-Mobil MRP',
    'DAS-Mobil Sevkiyat',
    'DAS-MODDAS',
    'DAS-MODDAS WEB',
    'DAS-Organizer',
    'DAS-POSDAS',
    'DAS-PROGRATİK',
    'Destek',
    'Diğer',
    'Eğitim',
    'Kodlama',
    'Lisans',
    'Moddas',
    'Muhasebe & Finans',
    'Satış & Pazarlama',
    'SOSYAL MEDYA',
    'Staj Proje',
    'Tasarım & Video',
    'Teknik İşler',
    'Test',
    'Toplantı',
    'Tübitak Proje',
    'Web İşleri',
  ];
  final konum = [
    ' ',
    'Beklemede',
    'Devam Ediyor'
        'Onay Bekliyor',
    'Tamamlandı',
    'İptal Edildi',
    'Özel',
  ];
  final altgrup = [
    ' ',
    'Ar-Ge',
    'Asorti',
    'Bayi',
    'Beta Test'
        'DASKEY',
    'Destek',
    'Diğer',
    'E-Fatura',
    'Eğitim',
    'E-İrsaliye',
    'Fatura',
    'Genel Liste',
    'Kodlama',
    'Lisans',
    'MD Sevkiyat',
    'MDDepo',
    'MDMobil',
    'MDMrp',
    'MDMSevkiyat',
    'MDSatış',
    'MDWeb',
    'Muhasebe',
    'Photoshop',
    'POSDAS',
    'Pratik Satış',
    'Progratik',
    'SOSYAL MEDYA',
    'Stajyer',
    'Stok Sayım',
    'Tasarım & Video',
    'Teknik İşler',
    'Toplantı',
    'Tübitak Proje',
    'Web işleri',
  ];
  final oncelik = [
    '01 - Normal',
    '02 - Yüksek',
    '03 - Çok Yüksek',
    '04 - Acil',
    '05 - Hata'
  ];
  String? valuegrup, valuekonum, valuealtgrup, valueoncelik;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Organizer"),
          // elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 74, 187, 240),
                Color.fromARGB(255, 4, 65, 95)
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
          ),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.create),
              text: 'Kayıt Bilgileri',
            ),
            Tab(
              icon: Icon(Icons.list),
              text: 'Liste',
            )
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar1(),
        body: TabBarView(children: [
          KayitBilgileri(),
          OrganizerList(
            islemAciklamasi: _islemAciklamasi,
          ),
        ]),
      ),
    );
  }

  @override
  KayitBilgileri() {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InputDecorator(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(left: 16.0, right: 16.0),
                  floatingLabelStyle: const TextStyle(
                      color: Color.fromARGB(255, 19, 84, 138),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  labelText: 'Tarih',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 19, 84, 138), width: 2.0)),
                ),
                child: TextField(
                  controller: dateinput,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      floatingLabelAlignment: FloatingLabelAlignment.center),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd.MM.yyyy').format(pickedDate);
                      setState(() {
                        dateinput.text = formattedDate;
                      });
                    }
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                floatingLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 19, 84, 138),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                labelText: 'Saat',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 19, 84, 138), width: 2.0)),
              ),
              child: ListTile(
                title: Text("${time.hour}:${time.minute}"),
                trailing: const Icon(Icons.watch_later),
                onTap: _pickTime,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                floatingLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 19, 84, 138),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                labelText: 'Sorumlu',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 19, 84, 138), width: 2.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                floatingLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 19, 84, 138),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                labelText: 'Grubu',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 19, 84, 138), width: 2.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: valuegrup,
                  icon: const Icon(Icons.arrow_drop_down,
                      color: Color.fromARGB(255, 19, 84, 138)),
                  iconSize: 30,
                  isExpanded: true,
                  items: grup.map(buildMenuItem).toList(),
                  onChanged: (valuegrup) =>
                      setState(() => this.valuegrup = valuegrup),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                floatingLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 19, 84, 138),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                labelText: 'Konum',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 19, 84, 138), width: 2.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: valuekonum,
                  icon: const Icon(Icons.arrow_drop_down,
                      color: Color.fromARGB(255, 19, 84, 138)),
                  iconSize: 30,
                  isExpanded: true,
                  items: konum.map(buildMenuItem).toList(),
                  onChanged: (valuekonum) =>
                      setState(() => this.valuekonum = valuekonum),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16.0, right: 16.0),
                floatingLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 19, 84, 138),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                labelText: 'Alt Grup',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 19, 84, 138), width: 2.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: valuealtgrup,
                  icon: const Icon(Icons.arrow_drop_down,
                      color: Color.fromARGB(255, 19, 84, 138)),
                  iconSize: 30,
                  isExpanded: true,
                  items: altgrup.map(buildMenuItem).toList(),
                  onChanged: (valuealtgrup) =>
                      setState(() => this.valuealtgrup = valuealtgrup),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                floatingLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 19, 84, 138),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                labelText: 'Öncelik',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 19, 84, 138), width: 2.0)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: valueoncelik,
                  icon: const Icon(Icons.arrow_drop_down,
                      color: Color.fromARGB(255, 19, 84, 138)),
                  iconSize: 30,
                  isExpanded: true,
                  items: oncelik.map(buildMenuItem).toList(),
                  onChanged: (valueoncelik) =>
                      setState(() => this.valueoncelik = valueoncelik),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                floatingLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 19, 84, 138),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                labelText: 'Yetkili',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 19, 84, 138), width: 2.0)),
              ),
              child: const TextField(
                decoration: InputDecoration(border: InputBorder.none),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                floatingLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 19, 84, 138),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                labelText: 'Telefon',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 19, 84, 138), width: 2.0)),
              ),
              child: TextField(
                inputFormatters: [maskFormatter],
                decoration: InputDecoration(border: InputBorder.none),
                //maxLines: null,
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                floatingLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 19, 84, 138),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                labelText: 'Firma Adı',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 19, 84, 138), width: 2.0)),
              ),
              child: const TextField(
                decoration: InputDecoration(border: InputBorder.none),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InputDecorator(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16.0, right: 16.0),
                floatingLabelStyle: const TextStyle(
                    color: Color.fromARGB(255, 19, 84, 138),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                labelText: 'İşlem Açıklaması',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 19, 84, 138), width: 2.0)),
              ),
              child: TextField(
                controller: _islemAciklamasi,
                decoration: InputDecoration(border: InputBorder.none),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ),
        ]),
      ),
    ));
  }

  _pickTime() async {
    TimeOfDay? t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (t != null) {
      setState(() {
        time = t;
      });
    }
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      );
}

class BottomNavigationBar1 extends StatelessWidget {
  TextEditingController _islemAciklamasi = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 74, 187, 240),
          Color.fromARGB(255, 4, 65, 95)
        ],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      )),
      child: BottomAppBar(
        //elevation: 0,
        color: Colors.transparent,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconBottomBar(
                  text: 'Yeni Ekle',
                  icon: Icons.create_new_folder,
                  //selected: true,
                  onPressed: () {},
                ),
                IconBottomBar(
                  text: 'Kaydet',
                  icon: Icons.check,
                  //selected: true,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OrganizerList(
                            islemAciklamasi: _islemAciklamasi.text)));
                  },
                ),
                IconBottomBar(
                  text: 'Vazgeç',
                  icon: Icons.cancel,
                  //selected: true,
                  onPressed: () {},
                ),
                IconBottomBar(
                  text: 'Sil',
                  icon: Icons.delete,
                  //selected: true,
                  onPressed: () {},
                ),
                IconBottomBar(
                  text: 'Kopya Kayıt',
                  icon: Icons.file_copy_outlined,
                  //selected: true,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onPressed;

  const IconBottomBar(
      {required this.text,
      required this.icon,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(icon, size: 30, color: Colors.white)),
        Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            height: 0.5,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
