import 'package:ebay_motors/core/assets/assets.dart';
import 'package:ebay_motors/core/components/colors.dart';
import 'package:ebay_motors/core/components/my_components.dart';
import 'package:ebay_motors/core/services/Locate_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Width and length of screen
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: SizedBox(
                  width: width,
                  child: Text(
                    'Cart',
                    style: TextStyle(fontSize: 30, color: MyColors().grey),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: SizedBox(
                width: width * 0.9,
                child: ListView.builder(
                  itemCount: cartDetails.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Stack(
                      children: [
                        Container(
                          height: height * 0.4,
                          decoration: BoxDecoration(
                              border: Border.all(color: MyColors().black)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(cartDetails[index]['image']!),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  cartDetails[index]['name']!,
                                  style: TextStyle(
                                      fontSize: 20, color: MyColors().grey),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  '${cartDetails[index]['price']!}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                      color: MyColors().red),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total payment:',
                                      style: TextStyle(
                                          fontSize: 20, color: MyColors().grey),
                                    ),
                                    Text(
                                      '${cartDetails[index]['price']!}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20,
                                          color: MyColors().red),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(),
                                    myButton(
                                        height: height * 0.05,
                                        function: () {},
                                        text: 'Procced to payment',
                                        fontSize: 15,
                                        backgroundColor: MyColors().yellow),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: InkWell(
                            onTap: () => Get.defaultDialog(
                              content: Column(
                                children: [
                                  Image.asset(alert),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('Are you sure to cancel order?')
                                ],
                              ),
                              title: '',
                              textCancel: 'No',
                              textConfirm: 'Yes',
                              buttonColor: MyColors().yellow,
                              radius: 0,
                              onConfirm: () {
                                cartDetails.removeAt(index);
                                Get.back();
                              },
                            ),
                            child: Container(
                              height: 30,
                              width: 30,
                              child: Icon(Icons.cancel_outlined),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: MyColors().yellow),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
