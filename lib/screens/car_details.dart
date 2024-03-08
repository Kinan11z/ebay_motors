import 'package:ebay_motors/core/components/colors.dart';
import 'package:ebay_motors/core/components/my_components.dart';
import 'package:ebay_motors/core/assets/assets.dart';
import 'package:ebay_motors/core/services/Locate_data.dart';
import 'package:ebay_motors/state_management/navigate_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarDetails(),
    );
  }
}

class CarDetails extends StatelessWidget {
  CarDetails({super.key});

  NavigateController controller = Get.put(NavigateController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Row(
          children: [
            GetBuilder<NavigateController>(builder: (controller) {
              return IconButton(
                onPressed: () => controller.navToDetailsPage(),
                icon: Icon(Icons.arrow_back, size: 30),
                color: MyColors().grey,
              );
            }),
            Text('Car details',
                style: TextStyle(
                    color: MyColors().grey, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: DefaultTabController(
                length: 5,
                // Use a Builder here, otherwise DefaultTabController.of(context) below
                // returns null.
                child: Builder(
                  builder: (BuildContext context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: IconTheme(
                            data: IconThemeData(
                              size: 128.0,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: GetBuilder<NavigateController>(
                                builder: (controller) {
                              return TabBarView(children: [
                                Hero(
                                  tag: controller.carImage!,
                                  child: Image.asset(controller.carImage!,
                                      fit: BoxFit.fill),
                                ),
                                Image.asset(controller.carImage!,
                                    fit: BoxFit.fill),
                                Image.asset(controller.carImage!,
                                    fit: BoxFit.fill),
                                Image.asset(controller.carImage!,
                                    fit: BoxFit.fill),
                                Image.asset(controller.carImage!,
                                    fit: BoxFit.fill),
                              ]);
                            }),
                          ),
                        ),
                        TabPageSelector(
                          selectedColor: MyColors().yellow,
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          //*************************************** */
          Expanded(
            flex: 4,
            child: Row(
              children: [
                SizedBox(width: width * 0.05),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Model',
                        style: TextStyle(
                            color: MyColors().grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'Launch year',
                        style: TextStyle(
                            color: MyColors().grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'Company',
                        style: TextStyle(
                            color: MyColors().grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'Price',
                        style: TextStyle(
                            color: MyColors().grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'C/D RATING  ',
                        style: TextStyle(
                            color: MyColors().grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'Car engine',
                        style: TextStyle(
                            color: MyColors().grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'Horsepower',
                        style: TextStyle(
                            color: MyColors().grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'Battery',
                        style: TextStyle(
                            color: MyColors().grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  //*************************************** */
                ),
                Expanded(
                  child: GetBuilder<NavigateController>(builder: (controller) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.carDetails!['model']!,
                          style: TextStyle(
                              color: MyColors().grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          controller.carDetails!['launch year']!,
                          style: TextStyle(
                              color: MyColors().grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          controller.carDetails!['company']!,
                          style: TextStyle(
                              color: MyColors().grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          '${controller.carPrice}',
                          style: TextStyle(
                              color: MyColors().grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          '8.5/10',
                          style: TextStyle(
                              color: MyColors().grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          '4.4 L V8',
                          style: TextStyle(
                              color: MyColors().grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          '644 hp',
                          style: TextStyle(
                              color: MyColors().grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          '29.5 kw/h',
                          style: TextStyle(
                              color: MyColors().grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    );
                  }),
                )
              ],
            ),
            //*************************************** */
          ),
          Expanded(
            flex: 1,
            child: GetBuilder<NavigateController>(builder: (controller) {
              return Center(
                child: myButton(
                    function: () {
                      cartDetails.add({
                        'name':
                            '${controller.carDetails!['company']!} ${controller.carDetails!['model']!} ${controller.carDetails!['launch year']!}',
                        'price': controller.carPrice!,
                        'image': controller.carImage!
                      });
                      Get.defaultDialog(
                        content: Column(
                          children: [
                            Image.asset(success),
                            SizedBox(
                              height: 20,
                            ),
                            Text('Item added to your cart successful...')
                          ],
                        ),
                        title: '',
                        textCancel: 'Ok',
                        buttonColor: MyColors().yellow,
                        radius: 0,
                      );
                    },
                    text: '+Add to cart',
                    backgroundColor: MyColors().yellow,
                    height: height * 0.06),
              );
            }),
          ),
          Expanded(flex: 1, child: SizedBox())
        ],
      ),
    );
  }
}
