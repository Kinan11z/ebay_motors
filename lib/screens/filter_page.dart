import 'package:ebay_motors/core/components/colors.dart';
import 'package:ebay_motors/core/components/my_components.dart';
import 'package:ebay_motors/core/assets/assets.dart';
import 'package:ebay_motors/core/components/select_date.dart';
import 'package:ebay_motors/state_management/navigate_controller.dart';
import 'package:ebay_motors/state_management/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FilterPage(),
    );
  }
}

class FilterPage extends StatelessWidget {
  // TextField controller
  TextEditingController model = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController launchYear = TextEditingController();

  // injection controller
  NavigateController navigateController = Get.put(NavigateController());
  SliderController sliderController = Get.put(SliderController());

  FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Row(
          children: [
            GetBuilder<NavigateController>(builder: (navigatorController) {
              return IconButton(
                onPressed: () => navigatorController.navToFilterPage(),
                icon: Icon(Icons.arrow_back, size: 30),
                color: MyColors().grey,
              );
            }),
            Text('Filter',
                style: TextStyle(
                    color: MyColors().grey, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      //*************************************** */
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              width: width * 0.9,
              child: Column(
                children: [
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      'Model',
                      style: TextStyle(fontSize: 20, color: MyColors().grey),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: myFormField(
                        controller: model,
                        type: TextInputType.emailAddress,
                        validate: (p0) {},
                        label: ''),
                  ),
                  //*************************************** */
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      'Company',
                      style: TextStyle(fontSize: 20, color: MyColors().grey),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: myFormField(
                        controller: company,
                        type: TextInputType.emailAddress,
                        validate: (p0) {},
                        label: ''),
                  ),
                  //*************************************** */
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      'Price',
                      style: TextStyle(fontSize: 20, color: MyColors().grey),
                    ),
                  ),
                  GetBuilder<SliderController>(
                    builder: (sliderController) {
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: RangeSlider(
                                  values: sliderController.sliderValue,
                                  min: 20000,
                                  // activeColor: Colors.transparent,
                                  max: 1000000,
                                  labels: RangeLabels('min', 'max'),
                                  onChanged: (value) {
                                    sliderController.getValue(value);
                                    price.text =
                                        '${sliderController.sliderValue.start.toInt()} - ${sliderController.sliderValue.end.toInt()}';
                                  },
                                ),
                              ),
                              Positioned(
                                left: 20,
                                child: Text('min'),
                              ),
                              Positioned(
                                right: 0,
                                child: Text('max'),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.8,
                            child: myFormField(
                              controller: price,
                              style: TextStyle(
                                color: MyColors().grey,
                              ),
                              type: TextInputType.emailAddress,
                              validate: (p0) {},
                              label: '',
                              textAlign: TextAlign.center,
                              readOnly: true,
                              suffix: Icon(
                                Icons.attach_money,
                                color: MyColors().grey,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  //*************************************** */
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      'Launch Year ',
                      style: TextStyle(fontSize: 20, color: MyColors().grey),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.8,
                    child: myFormField(
                        onTap: () => selectYearRange(context, launchYear),
                        controller: launchYear,
                        type: TextInputType.emailAddress,
                        readOnly: true,
                        textAlign: TextAlign.center,
                        validate: (p0) {
                          SfDateRangePicker(
                            view: DateRangePickerView.year,
                          );
                        },
                        label: ''),
                  ),
                ],
              ),
            ),
          ),
          //*************************************** */
          Expanded(
            flex: 1,
            child: Center(
              child: myButton(
                  function: () {},
                  text: 'Apply',
                  backgroundColor: MyColors().yellow,
                  height: height * 0.06,
                  width: width * 0.35),
            ),
          ),
        ],
      ),
    );
  }
}
