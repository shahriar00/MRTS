import 'package:flutter/material.dart';
import 'package:mrts/utils/dimensions.dart';
import 'package:mrts/utils/images.dart';
import 'package:mrts/utils/style.dart';

class TrainDes {
  TrainDes(this.name, this.image);
  final String name;
  final String image;
}

class TrainStart {
  TrainStart(this.name, this.image);
  final String name;
  final String image;
}

class TopSections extends StatefulWidget {
  const TopSections({Key? key}) : super(key: key);

  @override
  State<TopSections> createState() => _TopSectionsState();
}

class _TopSectionsState extends State<TopSections> {
  late TrainDes currentChoice;
  late TrainStart currentOption;

  final List<TrainDes> items = [
    TrainDes("Onboarding", Images.rectangle),
    TrainDes("Uttara North", Images.rectangle),
    TrainDes("Uttara Center", Images.rectangle),
    TrainDes("Uttara South", Images.rectangle),
    TrainDes("Mirpur 12", Images.rectangle),
    TrainDes("Mirpur 11", Images.rectangle),
    TrainDes("Mirpur 10", Images.rectangle),
    TrainDes("Agargoa", Images.rectangle),
    TrainDes("Farmgate", Images.rectangle),
    TrainDes("Dhaka University", Images.rectangle),
    TrainDes("Secretariate", Images.rectangle),
    TrainDes("Motijel", Images.rectangle),
  ];

  final List<TrainStart> itemstart = [
    TrainStart("Destination", Images.location),
    TrainStart("Uttara North", Images.location),
    TrainStart("Uttara Center", Images.location),
    TrainStart("Uttara South", Images.location),
    TrainStart("Mirpur 12", Images.location),
    TrainStart("Mirpur 11", Images.location),
    TrainStart("Mirpur 10", Images.location),
    TrainStart("Agargoa", Images.location),
    TrainStart("Farmgate", Images.location),
    TrainStart("Dhaka University", Images.location),
    TrainStart("Secretariate", Images.location),
    TrainStart("Motijel", Images.location),
  ];

  @override
  void initState() {
    super.initState();
    currentChoice = items[0];
    currentOption = itemstart[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.paddingSizeDefault),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: Dimensions.paddingSizeDefault),
          Text(
            "Find your train",
            style: ubuntuBold.copyWith(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Dimensions.paddingSizeSmall),

          /// Dropdown Menu for Train Onboarding.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                color: const Color(0xFFEBF3F1),
              ),
              child: Center(
                child: DropdownButtonFormField<TrainDes>(
                  isExpanded: true,
                  style: Theme.of(context).textTheme.titleLarge!,
                  decoration: const InputDecoration(enabledBorder: InputBorder.none),
                  value: currentChoice,
                  items: items.map<DropdownMenuItem<TrainDes>>(
                    (TrainDes item) => DropdownMenuItem<TrainDes>(
                      value: item,
                      child: Row(
                        children: [
                          SizedBox(width: Dimensions.paddingSizeDefault),
                          Image.asset(item.image, scale: 3),
                          SizedBox(width: Dimensions.paddingSizeDefault),
                          Text(item.name),
                        ],
                      ),
                    ),
                  ).toList(),
                  onChanged: (TrainDes? value) {
                    if (value != null) {
                      setState(() {
                        currentChoice = value;
                      });
                    }
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: Dimensions.paddingSizeSmall),

          /// Dropdown Menu for Train Destination.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
                color: const Color(0xFFEBF3F1),
              ),
              child: Center(
                child: DropdownButtonFormField<TrainStart>(
                  isExpanded: true,
                  decoration: const InputDecoration(enabledBorder: InputBorder.none),
                  style: Theme.of(context).textTheme.titleLarge!,
                  value: currentOption,
                  items: itemstart.map<DropdownMenuItem<TrainStart>>(
                    (TrainStart item) => DropdownMenuItem<TrainStart>(
                      value: item,
                      child: Row(
                        children: [
                          SizedBox(width: Dimensions.paddingSizeDefault),
                          Image.asset(item.image),
                          SizedBox(width: Dimensions.paddingSizeDefault),
                          Text(item.name),
                        ],
                      ),
                    ),
                  ).toList(),
                  onChanged: (TrainStart? value) {
                    if (value != null) {
                      setState(() {
                        currentOption = value;
                      });
                    }
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: Dimensions.paddingSizeExtraLarge),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xFF4D9D47),
                  ),
                  child: Center(
                    child: Text(
                      "Search Train",
                      style: ubuntuBold.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.fontSizeLarge,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: Dimensions.fontSizeSmall),

                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                    child: Center(child: Image.asset(Images.clock, scale: 2)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
