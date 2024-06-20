import 'dart:io' show Platform;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:WallArt/home.dart';
import 'package:WallArt/models/photos_model.dart';
import 'package:WallArt/view/categorie_screen.dart';
import 'package:WallArt/view/image_view.dart';

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget wallPaper(List<PhotosModel> listPhotos, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: listPhotos.map((PhotosModel photoModel) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImageView(
                            imgPath: photoModel.src.portrait,
                          )));
            },
            child: Hero(
              tag: photoModel.src.portrait,
              child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: kIsWeb
                        ? Image.network(
                            photoModel.src.portrait,
                            height: 50,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: photoModel.src.portrait,
                            placeholder: (context, url) => Container(
                                  color: Color(0xfff5f8fd),
                                ),
                            fit: BoxFit.cover)),
              ),
            ),
          ));
        }).toList()),
  );
}

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "WallArt",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Overpass',
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: 50),
      ),
    ],
  );
}

Widget menubar(context) {
  drawerSearch(cname) async {
    if (await interstitial.isLoaded) {
      interstitial.show();
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategorieScreen(
          categorie: cname,
        ),
      ),
    );
  }

  return Drawer(
    elevation: 0,
    child: ListView(
      physics: ScrollPhysics(),
      children: [
        Container(
            height: 100,
            child: DrawerHeader(
              child: FittedBox(
                child: Image.asset('asset/images/banner_drawer.png'),
                fit: BoxFit.fill,
              ),
            )),
        ListTile(
            dense: true,
            title: Text(
              'Home',
              style: TextStyle(fontSize: 15),
            ),
            leading: Icon(
              Icons.home,
              color: Colors.purple,
            ),
            onTap: () {}),
        ListTile(
          onTap: () {
            if (Platform.isAndroid) {
              _launchURL(
                  "https://play.google.com/store/apps/details?id=co.universetech.WallArt");
            } else if (Platform.isIOS) {
              _launchURL(
                  "https://play.google.com/store/apps/details?id=co.universetech.WallArt");
            }
          },
          dense: true,
          title: Text(
            'Rate Us',
            style: TextStyle(fontSize: 15),
          ),
          leading: Icon(Icons.rate_review, color: Colors.yellow[900]),
        ),
        Divider(),
        ListTile(
            dense: true,
            title: Text(
              'All Categories',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {}),
        Divider(),
        ListTile(
          onTap: () => drawerSearch('Love'),
          title: Text('Love'),
          leading: Icon(Icons.favorite, color: Colors.red),
        ),
        ListTile(
          onTap: () => drawerSearch('girl'),
          title: Text('Girls'),
          leading: Icon(Icons.pregnant_woman, color: Colors.yellow[700]),
        ),
        ListTile(
          onTap: () => drawerSearch('car'),
          title: Text('Cars'),
          leading: Icon(Icons.directions_car_outlined, color: Colors.red),
        ),
        ListTile(
          onTap: () => drawerSearch('technologies'),
          title: Text('Technology'),
          leading: Icon(Icons.miscellaneous_services, color: Colors.green),
        ),
        ListTile(
          onTap: () => drawerSearch('art'),
          title: Text('Art'),
          leading: Icon(Icons.ac_unit, color: Colors.purple),
        ),
        ListTile(
          onTap: () => drawerSearch('bike'),
          title: Text('Bike'),
          leading: Icon(Icons.pedal_bike, color: Colors.blue),
        ),
        ListTile(
          onTap: () => drawerSearch('flower'),
          title: Text('Flower'),
          leading: Icon(Icons.filter_vintage_sharp, color: Colors.pink),
        ),
        ListTile(
          onTap: () => drawerSearch('animal'),
          title: Text('Animals'),
          leading:
              Icon(Icons.bug_report_outlined, color: Colors.redAccent[700]),
        ),
        ListTile(
          onTap: () => drawerSearch('sport'),
          title: Text('Sports'),
          leading: Icon(Icons.sports_cricket, color: Colors.redAccent[700]),
        ),
        ListTile(
          onTap: () => drawerSearch('city'),
          title: Text('City'),
          leading: Icon(Icons.location_city_rounded, color: Colors.purple),
        ),
        ListTile(
          onTap: () => drawerSearch('food'),
          title: Text('Food'),
          leading: Icon(Icons.fastfood, color: Colors.redAccent[700]),
        ),
        ListTile(
          onTap: () => drawerSearch('men'),
          title: Text('Men'),
          leading: Icon(Icons.person_sharp, color: Colors.redAccent[700]),
        ),
        ListTile(
          onTap: () => drawerSearch('nature'),
          title: Text('Nature'),
          leading: Icon(Icons.spa, color: Colors.green),
        ),
        ListTile(
          onTap: () => drawerSearch('space'),
          title: Text('Space'),
          leading: Icon(Icons.wb_sunny_outlined, color: Colors.yellow),
        ),
        ListTile(
          onTap: () => drawerSearch('other'),
          title: Text('Other'),
          leading: Icon(Icons.devices_other, color: Colors.redAccent[700]),
        ),
      ],
    ),
  );
}
