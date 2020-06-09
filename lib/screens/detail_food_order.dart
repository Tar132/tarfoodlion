import 'package:flutter/material.dart';
import 'package:tarfoodlion/model/food_model.dart';
import 'package:tarfoodlion/utility/my_constant.dart';
import 'package:tarfoodlion/utility/my_style.dart';

class DetailFoodOrder extends StatefulWidget {
  final List<FoodModel> foodModels;
  DetailFoodOrder({Key key, this.foodModels});
  @override
  _DetailFoodOrderState createState() => _DetailFoodOrderState();
}

class _DetailFoodOrderState extends State<DetailFoodOrder> {
  List<FoodModel> foodModels;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    foodModels = widget.foodModels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //scafold ใช้ เมื่อ มีการ freshข้อมูล
      appBar: AppBar(
        title: Text('รายละเอียอาหาร'),
      ),
      body: ListView.builder(
        itemCount: foodModels.length,
        itemBuilder: (context, index) => showContent(index),
      ),
    );
  }

  Widget showContent(int index) => Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.all(8.0),
            child: Image.network(
              '${MyConstant().domain}${foodModels[index].pathImage}',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MyStyle().showTitleH2(foodModels[index].name),
                MyStyle().showTitle('ราคา ${foodModels[index].price} บาท'),
              ],
            ),
          ),
        ],
      );
}
