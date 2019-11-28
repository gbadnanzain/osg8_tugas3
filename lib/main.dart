import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Klub Sepak Bola",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarKlub = new List();

  var karakter = [
    {"nama": "Babel United", "gambar": "Babel_United.jpeg", "riwayat": "PS Bangka berdiri pada tahun 1970 dan pada era 70an sempat berjaya dengan menembus 8 besar Kompetisi Perserikatan Indonesia. Sejak kejayaan PS Bangka di era 70an, bisa dikatakan prestasi PS Bangka mengalami pasang surut, terlebih karena kurangnya dukungan finansial kepada klub. Pada musim 2011/12, dengan dukungan Pemerintah Provinsi Bangka Belitung serta doa seluruh masyarakat Bangka, memberikan kekuatan ekstra untuk pemain PS Bangka yang berhasil untuk pertama kalinya naik kasta (promosi) ke Divisi Utama Liga Indonesia pada musim 2013 mendatang. Musim 2011/12, PS Bangka yg bermain di Divisi I Liga Indonesia dengan semangat juang yang tinggi, secara gemilang berhasil promosi ke Divisi Utama Liga Indonesia musim 2013 setelah menjadi Runner Up Divisi I Liga Indonesia tahun 2011/12. PS Bangka akan memulai debut di Divisi Utama Liga Indonesia musim 2013 yang dimulai (kick off) pada bulan Januari 2013, dengan memasang target Promosi ke Liga Super Indonesia pada musim selanjutnya. Untuk merealisasikan itu semua tentunya tidak mudah, butuh pendanaan yang memadai agar PS Bangka dapat bersaing di kompetisi, diharapkan tidak hanya bantuan Pemerintah Provinsi Bangka Belitung saja, melainkan juga Perusahaan Swasta dan atau Bank Daerah yang ada di Bangka dapat membantu agar impian Masyarakat Bangka yaitu klub kebanggaannya, PS Bangka dapat tampil di kasta tertinggi kompetisi sepak bola Indonesia agar Sepak bola Bangka dapat mulai diperhitungkan dan Bangka jadi lebih dikenal oleh masyarakat daerah lainnya ketika bertandang di Bangka."},
    {"nama": "Jakarta United FC", "gambar": "Jakarta_United_FC.png", "riwayat": "Jakarta United Football Club (dahulu dikenal sebagai Jakarta Timur FC) adalah klub sepak bola amatir Indonesia yang berasal dari Jakarta Timur, DKI Jakarta. Saat ini Jakarta United FC bermain di Liga 3 Jakarta dan dimusim 2019 ini berhasil menjadi juara."},
    {"nama": "Mitra Kutai Kartanegara", "gambar": "Mitra_Kutai_Kartanegara.png","riwayat":"Mitra Kutai Kartanegara (disingkat: Mitra Kukar) adalah sebuah klub sepak bola Indonesia yang bermarkas di Kabupaten Kutai Kartanegara, Kalimantan Timur. Klub ini memiliki julukan sebagai Barisan Kuat dan Kekar dan Naga Mekes, sementara kelompok pendukungnya bernama Mitman (Mitra Mania). Seluruh pertandingan kandang Mitra Kukar dimainkan di Stadion Madya Aji Imbut, Tenggarong Seberang."},
    {"nama": "Persita Tangerang", "gambar": "Persita_Tangerang.png","riwayat":"Persatuan Sepak bola Indonesia Tangerang (disingkat Persita atau Persita Tangerang) adalah sebuah klub sepak bola Indonesia yang bermarkas di Tangerang. Tim berjuluk Pendekar Cisadane identik dengan kostum ungunya.Pada kompetisi Divisi Utama Liga Indonesia 2015, markas Persita adalah Stadion Maulana Yusuf di Serang. Kemudian pada musim 2018, Persita menggunakan Stadion Sport Center Dasana Indah Kab. Tangerang."},
    {"nama": "PSPS Riau", "gambar": "PSPS_Riau.jpeg","riwayat":"PSPS Riau singkatan dari Persatuan Sepak Bola Pekanbaru dan Sekitarnya (dulu dikenal dengan nama PSPS Pekanbaru) adalah klub sepak bola kebanggaan kota Pekanbaru, Riau. Pada musim kompetisi 2018, tim ini akan bermain di Liga 2 dan akan menggunakan Stadion Kaharuddin Nasution sebagai kandang. Pada awal musim 2018 Kursi pelatih PSPS dipegang oleh Hendri Susilo. Tim ini memiliki julukan Askar Bertuah dan Tapir Sumatra."},
    
  ];

  _buatlist() async {
    for (var i = 0; i < karakter.length; i++) {
      final karakternya = karakter[i];
      final String gambar = karakternya["gambar"];
      final String riwayat = karakternya["riwayat"];
      daftarKlub.add(new Container(
          padding: new EdgeInsets.all(10.0),
          child: new Card(
              child: new Column(
            children: <Widget>[
              new Klub(
                tag: karakternya['nama'],
                child: new Material(
                  child: new InkWell(
                    onTap: () =>
                        Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new Detail(
                                    nama: karakternya['nama'],
                                    gambar: gambar,
                                  ),
                            )),
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.all(10.0),
              ),
              new Text(
                karakternya['nama'],
                style: new TextStyle(fontSize: 20.0),


              )
            ],
          ))));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Eudeka ! Flutter Basic",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        children: daftarKlub,
      ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar, this.riwayat});
  final String nama;
  final String gambar;
  final String riwayat;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
              height: 240.0,
              child: new Klub(
                tag: nama,
                child: new Material(
                  child: new InkWell(
                    child: new Image.asset(
                      "img/$gambar",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          new BagianNama(
            nama: nama,
          ),
          new BagianIcon(),
          new Keterangan(),
        ],
      ),
    );
  }
}

class BagianNama extends StatelessWidget {
  BagianNama({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nama,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue),
                ),
                new Text(
                  "$nama\@gmail.com",
                  style: new TextStyle(fontSize: 17.0, color: Colors.grey),
                ),
              ],
            ),
          ),
          new Row(
            children: <Widget>[
              new Icon(
                Icons.star,
                size: 30.0,
                color: Colors.red,
              ),
              new Text(
                "12",
                style: new TextStyle(fontSize: 18.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

class BagianIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          
          new Iconteks(
            icon: Icons.message,
            teks: "Message",
          ),
          new Iconteks(
            icon: Icons.photo,
            teks: "Photo",
          ),
        ],
      ),
    );
  }
}

class Iconteks extends StatelessWidget {
  Iconteks({this.icon, this.teks});
  final IconData icon;
  final String teks;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            teks,
            style: new TextStyle(fontSize: 18.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            style: new TextStyle(fontSize: 18.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
