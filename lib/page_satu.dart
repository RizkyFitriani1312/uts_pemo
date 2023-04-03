import 'package:flutter/material.dart';
import 'package:rizkyfitriani_uts_pemrogramanmobile/page_dua.dart';

class PageSatu extends StatelessWidget {
  const PageSatu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.amberAccent,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: CircleAvatar(),
                      title: Text("Nama Lengkap"),
                      subtitle: Text("Alamat"),
                    )
                  ]),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(),
                    title: Text("Nama Lengkap"),
                    subtitle: Text("Alamat"),
                  )),
            ),
          ],
        ),
      ),
        appBar: AppBar(
          elevation: 0,
          //backgroundColor: Colors.transparent,
          title: Text(
            "Page 1",
            style: TextStyle(color: Colors.black),
          ),
          //Container(height: 20,color: Colors.amber,),
          centerTitle: true,
          leading: Container(color: Colors.yellow,),leadingWidth: 100,
          actions: [Text("Tombol 1"),Text("Tombol 2"),],
          bottom: PreferredSize(preferredSize: Size.fromHeight(100),
            child: Container(height: 100,color: Colors.red,width: 20,),),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageDua()),
              );
            },
            child: Text("Pindah Ke Halaman 2"),
          ),
        ),
    );
  }
}

