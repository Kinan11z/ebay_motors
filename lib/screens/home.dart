import 'package:ebay_motors/core/components/colors.dart';
import 'package:ebay_motors/core/assets/assets.dart';
import 'package:ebay_motors/core/services/Locate_data.dart';
import 'package:ebay_motors/screens/car_details.dart';
import 'package:ebay_motors/state_management/navigate_controller.dart';
import 'package:flutter/material.dart';
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // injection controller
  NavigateController controller = Get.put(NavigateController());

  @override
  Widget build(BuildContext context) {
    //Width and length of screen
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: SizedBox(
                          width: width,
                          child: Text(
                            'Home',
                            style:
                                TextStyle(fontSize: 30, color: MyColors().grey),
                          )),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.7,
                            height: height * 0.05,
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 10),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: MyColors().grey,
                                  ),
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 0.25)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.1,
                          ),
                          GetBuilder<NavigateController>(builder: (controller) {
                            return InkWell(
                                onTap: () {
                                  controller.navToFilterPage();
                                },
                                child: Image.asset(filter));
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //*************************************** */
            Expanded(
              flex: 4,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 40, left: 10, right: 10),
                    child:
                        GetBuilder<NavigateController>(builder: (controller) {
                      return InkWell(
                        onTap: () {
                          controller.navToDetailsPage();
                          controller.getCarDetails(
                              image: carImage[index],
                              price: carPrice[index],
                              details: carName[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: MyColors().grey)),
                          height: height * 0.08,
                          child: Row(children: [
                            Expanded(
                                flex: 1,
                                child: Hero(
                                  tag: carImage[index],
                                  child: Image.asset(
                                    carImage[index],
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${carName[index]['company']!} ${carName[index]['model']!} ${carName[index]['launch year']!}',
                                        style:
                                            TextStyle(color: MyColors().grey),
                                      ),
                                      Text(carPrice[index],
                                          style:
                                              TextStyle(color: MyColors().grey))
                                    ],
                                  ),
                                ))
                          ]),
                        ),
                      );
                    }),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
