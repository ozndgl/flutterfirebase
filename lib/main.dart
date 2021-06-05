import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.cyan,
    ),
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String ad="";
  String id="";
  String kategori="";
  double fiyat= 0;

  urunAdiAl(urunAdi){
    this.ad = urunAdi;
  }

  urunIdsiAl(urunIdsi){
    this.id = urunIdsi;
  }

  urunKategorisiAl( urunKategorisi){
    this.kategori = urunKategorisi;
  }

  urunFiyatiAl(urunFiyati){
    this.fiyat = double.parse(urunFiyati);
  }

  veriEkle(){
    print("eklendi");

    //Veritabanı yolu
    DocumentReference veriyolu = Firestore.instance.collection("Urunler").document(ad);


    //çoklu veri gönderme

    Map<String,dynamic> urunler = {
      "urunAdi": ad,
      "urunId": id,
      "urunKategori": kategori,
      "urunFiyat": fiyat
    };
    
    veriyolu.setData(urunler).whenComplete(() {
      print(ad+" eklendi");
    });
  }

  veriOku(){
    print("okundu");
  }

  veriGuncelle(){
    print("güncellendi");
  }

  veriSil(){
    print("silindi");
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dodo müşteri takip"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "ürün adı",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String urunAdi)
                {
                  urunAdiAl(urunAdi);

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "ürün Id",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String urunIdsi)
                {
                  urunIdsiAl(urunIdsi);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "ürün kategorisi",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String urunKatedorisi)
                {
                  urunKategorisiAl(urunKatedorisi);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "ürün fiyatı",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
                onChanged: (String urunFiyati)
                {
                  urunFiyatiAl(urunFiyati);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

              children: [
                RaisedButton(
                  color: Colors.cyan,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
                  child: Text("ekle"),
                  textColor: Colors.white,
                  onPressed: (){

                    veriEkle();
                  },

                ),
                RaisedButton(
                  color: Colors.red,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                  child: Text("oku"),
                  textColor: Colors.white,
                  onPressed: (){
                    veriOku();
                  },


                ),
                RaisedButton(
                  color: Colors.green,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                  child: Text("güncelle"),
                  textColor: Colors.white,
                  onPressed: (){
                    veriGuncelle();
                  },

                ),
                RaisedButton(
                  color: Colors.brown,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                  child: Text("sil "),
                  textColor: Colors.white,
                  onPressed: (){
                    veriSil();
                  },

                ),
              ],),
            )

          ],
        ),
      ),
    );
  }
}
