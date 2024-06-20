import 'package:flutter/material.dart';

import '../models/categorie_model.dart';

String apiKEY = "563492ad6f91700001000001f667f6e29a094d3dbb95456454e34ff6";

List<CategorieModel> getCategories() {
  List<CategorieModel> categories = new List();
  CategorieModel categorieModel = new CategorieModel();

  //

  categorieModel.imgUrl = "asset/cats/love.png";
  categorieModel.categorieName = "Love";
  categorieModel.icon = Icon(
    Icons.favorite,
    color: Colors.red,
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl = "asset/cats/girls.png";
  categorieModel.categorieName = "Girls";
  categorieModel.icon = Icon(
    Icons.pregnant_woman,
    color: Colors.yellow[700],
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl = "asset/cats/car.png";
  categorieModel.categorieName = "Cars";
  categorieModel.icon = Icon(
    Icons.directions_car_outlined,
    color: Colors.red,
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  categorieModel.imgUrl = "asset/cats/technology.png";
  categorieModel.categorieName = "Technologies";
  categorieModel.icon = Icon(
    Icons.directions_car_outlined,
    color: Colors.red,
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();
  //
  categorieModel.imgUrl = "asset/cats/art.png";
  categorieModel.categorieName = "Art";
  categorieModel.icon = Icon(
    Icons.ac_unit,
    color: Colors.purple,
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl = "asset/cats/bike.png";
  categorieModel.categorieName = "Bike";
  categorieModel.icon = Icon(
    Icons.pedal_bike,
    color: Colors.blue,
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl = "asset/cats/flower.png";
  categorieModel.categorieName = "Flowers";
  categorieModel.icon = Icon(
    Icons.filter_vintage_sharp,
    color: Colors.pink,
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl = "asset/cats/animals.png";
  categorieModel.categorieName = "Animals";
  categorieModel.icon = Icon(
    Icons.bug_report_outlined,
    color: Colors.redAccent[700],
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl = "asset/cats/sport.png";
  categorieModel.categorieName = "Sports";
  categorieModel.icon = Icon(
    Icons.sports_cricket,
    color: Colors.redAccent[700],
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl = "asset/cats/city.png";
  categorieModel.categorieName = "City";
  categorieModel.icon = Icon(
    Icons.location_city_rounded,
    color: Colors.purple,
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl = "asset/cats/food.png";
  categorieModel.categorieName = "Food";
  categorieModel.icon = Icon(
    Icons.fastfood,
    color: Colors.redAccent[700],
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl = "asset/cats/men.png";
  categorieModel.categorieName = "Men";
  categorieModel.icon = Icon(
    Icons.person_sharp,
    color: Colors.redAccent[700],
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl = "asset/cats/nature.png";
  categorieModel.categorieName = "Nature";
  categorieModel.icon = Icon(
    Icons.spa,
    color: Colors.green,
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl = "asset/cats/space.png";
  categorieModel.categorieName = "Space";
  categorieModel.icon = Icon(
    Icons.wb_sunny_outlined,
    color: Colors.yellow,
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  //
  categorieModel.imgUrl = "asset/cats/other.png";
  categorieModel.categorieName = "Other";
  categorieModel.icon = Icon(
    Icons.devices_other,
    color: Colors.redAccent[700],
  );
  categories.add(categorieModel);
  categorieModel = new CategorieModel();

  return categories;
}
