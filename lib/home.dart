import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:WallArt/ad_manager.dart';
import 'package:WallArt/data/data.dart';
import 'dart:convert';
import 'package:WallArt/models/categorie_model.dart';
import 'package:WallArt/models/photos_model.dart';
import 'package:WallArt/view/categorie_screen.dart';
import 'package:WallArt/view/search_view.dart';
import 'package:WallArt/widget/widget.dart';

AdmobInterstitial interstitial;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategorieModel> categories = new List();

  int noOfImageToLoad = 30;
  List<PhotosModel> photos = new List();

  getTrendingwallsWorld() async {
    await http.get(
        "https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=1",
        headers: {"Authorization": apiKEY}).then((value) {
      //print(value.body);

      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //print(element);
        PhotosModel photosModel = new PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
        //print(photosModel.toString()+ "  "+ photosModel.src.portrait);
      });

      setState(() {});
    });
  }

  TextEditingController searchController = new TextEditingController();

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    //getwallsWorld();
    getTrendingwallsWorld();
    categories = getCategories();
    interstitial = AdmobInterstitial(adUnitId: AdManager.androidInterstitialId);
    interstitial.load();
    super.initState();

    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          noOfImageToLoad = noOfImageToLoad + 30;
          getTrendingwallsWorld();
        }
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: menubar(context),
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.symmetric(horizontal: 24),
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                          hintText: "Search in WallArt",
                          border: InputBorder.none),
                    )),
                    InkWell(
                        onTap: () async {
                          if (await interstitial.isLoaded) {
                            interstitial.show();
                          }

                          if (searchController.text != "") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchView(
                                  search: searchController.text,
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(child: Icon(Icons.search)))
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                height: 82,
                child: ListView.builder(
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    /// Create List Item tile
                    return CategoriesTile(
                      imgUrls: categories[index].imgUrl,
                      categorie: categories[index].categorieName,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              wallPaper(photos, context),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Photos provided By ",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Overpass'),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchURL("https://www.pexels.com/");
                    },
                    child: Container(
                      child: Text(
                        "Pexels",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontFamily: 'Overpass'),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrls, categorie;

  CategoriesTile({@required this.imgUrls, @required this.categorie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await interstitial.isLoaded) {
          interstitial.show();
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategorieScreen(
              categorie: categorie,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 8,
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              imgUrls,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                categorie ?? "WallArt",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Overpass'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
