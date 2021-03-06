import 'package:flutter/material.dart';
import 'package:yum/Pages/MenuService/FoodForm.dart';
import 'package:yum/Pages/MenuService/FoodNotif.dart';
import 'package:provider/provider.dart';
import 'package:yum/Pages/MenuService/MenuDetails.dart';
import 'package:yum/Services/MenuService.dart';
import 'package:yum/constants.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    FoodNotifier foodNotif = Provider.of<FoodNotifier>(context, listen: false);
    getFood(foodNotif);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotif = Provider.of<FoodNotifier>(context);

    print("Menu");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MENU",
          style: TextStyle(
              color: Color(0xFF171311),
              fontSize: 30,
              fontFamily: "Permanent Marker"),
        ),
        backgroundColor: kPrimaryButtonColor,
        elevation: 0.0,
      ),
      backgroundColor: kPrimaryColor,
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(
              foodNotif.foodList[index].image != null
                  ? foodNotif.foodList[index].image
                  : 'https://media.discordapp.net/attachments/460202875851767808/786416323890249788/mouthMainLogo2.png',
              width: 120,
              fit: BoxFit.fitWidth,
            ),
            title: Text(
              foodNotif.foodList[index].name,
              style: TextStyle(
                  color: kPrimaryIconColor, fontSize: 25, fontFamily: "Oswald"),
            ),
            subtitle: Text(foodNotif.foodList[index].category),
            onTap: () {
              foodNotif.currentFood = foodNotif.foodList[index];
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return FoodDetail();
                  },
                ),
              );
            },
          );
        },
        itemCount: foodNotif.foodList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          foodNotif.currentFood = null;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return FoodForm(
              update: false,
            );
          }));
        },
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
      ),
    );
  }
}
