import 'package:carrental/constants.dart';
import 'package:carrental/core/DB/DBVeihcle.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/models/veihcle.dart';
import 'package:carrental/features/customer/widgets/customCarCard.dart';
import 'package:carrental/features/customer/widgets/selectionRow.dart';
import 'package:flutter/material.dart';

class CustomerHomeView extends StatefulWidget {
  const CustomerHomeView({Key? key}) : super(key: key);

  @override
  State<CustomerHomeView> createState() => _CustomerHomeViewState();
}

class _CustomerHomeViewState extends State<CustomerHomeView> {
  String? defaul = 'all          ';
  String? citydropDownValue = 'all          ';
  List<String> cityList = [];
  String? modaldropDownValue = 'all          ';
  List<String> modalList = [];
  String? yeardropDownValue = 'all          ';
  List<String> yearList = [];
  String? colordropDownValue = 'all          ';
  List<String> colorList = [];
  List<Vehicle> vehicles = [];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      cityList = await DBVehicle.getAllCities();
      cityList.insert(0, 'all          ');
      modalList = await DBVehicle.getAllModals();
      modalList.insert(0, 'all          ');
      yearList = await DBVehicle.getAllYears();
      yearList.insert(0, 'all          ');
      colorList = await DBVehicle.getAllColors();
      colorList.insert(0, 'all          ');
      vehicles = await DBVehicle.getAllVehicles();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: customBoxDecoration(
          [kprimaryColor0, kprimaryColor1, kprimaryColor2],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: 30),
              ),
              const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "Pick up a car !",
                    style: TextStyle(
                        fontSize: 45, fontFamily: 'Caveat', color: Colors.red),
                  ),
                ),
              ),
              SelectionRow(
                dropDownval: citydropDownValue!,
                itemList: cityList,
                name: "city",
                onChanged: (p0) async {
                    vehicles = await DBVehicle.getVehiclesByCriteria(
                      city: p0,
                      color: colordropDownValue,
                      modal: modaldropDownValue,
                      year: yeardropDownValue);
                  setState(() {
                    citydropDownValue = p0;
                  });
                
                },
              ),
              SelectionRow(
                dropDownval: modaldropDownValue!,
                itemList: modalList,
                name: "modal",
                onChanged: (p0) async {
                   vehicles = await DBVehicle.getVehiclesByCriteria(
                      city: citydropDownValue,
                      color: colordropDownValue,
                      modal: p0,
                      year: yeardropDownValue);
                  setState(() {
                    modaldropDownValue = p0;
                  });
                 
                },
              ),
              SelectionRow(
                dropDownval: colordropDownValue!,
                itemList: colorList,
                name: "color",
                onChanged: (p0) async {
                   vehicles = await DBVehicle.getVehiclesByCriteria(
                      city: citydropDownValue,
                      color: p0,
                      modal: modaldropDownValue,
                      year: yeardropDownValue);
                  setState(() {
                    colordropDownValue = p0;
                  });
                 
                },
              ),
              SelectionRow(
                dropDownval: yeardropDownValue!,
                itemList: yearList,
                name: "year",
                onChanged: (p0) async {
                   vehicles = await DBVehicle.getVehiclesByCriteria(
                      city: citydropDownValue,
                      color: colordropDownValue,
                      modal: modaldropDownValue,
                      year: p0);
                  setState(() {
                    yeardropDownValue = p0;
                  });
                  
                },
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 60,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return CustomCarCard(
                    vehicle: vehicles[index],
                  );
                }, childCount: vehicles.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
