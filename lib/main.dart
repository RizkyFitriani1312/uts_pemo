import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rizkyfitriani_uts_pemrogramanmobile/page_satu.dart';
import 'package:rizkyfitriani_uts_pemrogramanmobile/page_dua.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController namaProduk = TextEditingController();
  TextEditingController hargaProduk = TextEditingController();
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: isDark ? Brightness.dark : Brightness.light,
          //brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          //primarySwatch: Colors.green,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.grey,
          ),
          //accentColor: Colors.green,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
          )),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title: Text(
            "Welcome to Violet PetShop",
            maxLines: 2,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              letterSpacing: 10,
              wordSpacing: 40,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.black, Colors.red, Colors.blue],
              begin: Alignment.bottomCenter,
              end: Alignment.topLeft,
            ),
          ),
          height: 100,
          width: 100,
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  image: DecorationImage(
                    //fit: BoxFit.contain,
                    //fit: BoxFit.cover,
                    //fit: BoxFit.fill,
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/day.jpeg"),
                  ),
                ),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  image: DecorationImage(
                    //fit: BoxFit.contain,
                    //fit: BoxFit.cover,
                    //fit: BoxFit.fill,
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/night.jpeg"),
                  ),
                ),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  image: DecorationImage(
                    //fit: BoxFit.contain,
                    //fit: BoxFit.cover,
                    //fit: BoxFit.fill,
                    fit: BoxFit.fitWidth,
                    image: AssetImage("assets/sakura.jpeg"),
                  ),
                ),
              ),
            ]),
            Switch(
                value: isDark,
                onChanged: (value) {
                  setState(() {
                    isDark = value;
                  });
                  print(isDark);
                }),
            TextField(
              controller: namaProduk,
              onChanged: (value) {
                setState(() {
                  namaProduk.text;
                });
              },
              decoration: InputDecoration(
                hintText: "Masukan Nama Produk",
                suffixIcon: Icon(Icons.people),
              ),
            ),
            TextField(
              controller: hargaProduk,
              onChanged: (value) {
                setState(() {
                  hargaProduk.text;
                });
              },
              decoration: InputDecoration(hintText: "Harga Produk"),
            ),
            SizedBox(
              height: 30,
            ),
            Text("${namaProduk.text} ${hargaProduk.text}")
          ]),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String data = "Nothing";
  @override
  Widget build(BuildContext context) {
    AppBar myAppbar = AppBar(
      title: Text("Responsive"),
    );
    final double heightDevice = MediaQuery.of(context).size.height;
    final double bodyApp = heightDevice -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    final double widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Tambah Data Produk"),
                content: Text("Apakah ingin mengubah data?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop("No");
                      },
                      child: Text("No")),
                  ElevatedButton(
                      onPressed: () {
                        //Navigator.of(context).pop();
                        Navigator.pop(context, "Data Diubah");
                      },
                      child: Text("Yes")),
                ],
              );
            },
          ).then((value) {
            setState(() {
              data = value;
            });
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: myAppbar,
      body: Column(
        children: [
          Container(
            height: bodyApp * 0.4,
            width: widthDevice,
            color: Colors.red,
          ),
          Container(
            height: bodyApp * 0.4,
            width: widthDevice,
            color: Colors.pink,
            alignment: Alignment.center,
            child: Platform.isAndroid ? Text("Android") : Text("iOS"),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: bodyApp * 0.4,
            width: widthDevice,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                AspectRatio(
                  aspectRatio: 4 / 6,
                  child: Container(
                    color: Colors.redAccent,
                    margin: EdgeInsets.only(right: 20),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 4 / 6,
                  child: Container(
                    color: Colors.orange,
                    margin: EdgeInsets.only(right: 20),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 4 / 6,
                  child: Container(
                    color: Colors.deepOrange,
                    margin: EdgeInsets.only(right: 20),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 4 / 6,
                  child: Container(
                    color: Colors.deepOrangeAccent,
                    margin: EdgeInsets.only(right: 20),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 4 / 6,
                  child: Container(
                    color: Colors.amberAccent,
                    margin: EdgeInsets.only(right: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListV extends StatelessWidget {
  const ListV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 300,
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, i) {
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.blue,
              child: Text("Anton"),
              padding: EdgeInsets.all(20),
            );
          },
        ),
      ),
    );
  }
}

class Route extends StatefulWidget {
  const Route({Key? key}) : super(key: key);

  @override
  State<Route> createState() => _RouteState();
}

class _RouteState extends State<Route> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageSatu(),
      routes: {
        'page_satu': (context) => PageSatu(),
        'page_dua': (context) => PageDua(),
      },
    );
  }
}

// routes: {
//   'page_satu': (context) => PageSatu(),
//   'page_dua': (context) => PageDua(),
// },
