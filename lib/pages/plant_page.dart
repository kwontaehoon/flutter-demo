import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/app_colors.dart";
import "package:flutter_svg/flutter_svg.dart";

class PlantPage extends StatelessWidget {
  const PlantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopPortion(),
            SearchPortion(),
            CategoryTab(),
            GridPortion(),
          ],
        ),
      ),
    );
  }
}

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class TopPortion extends StatelessWidget {
  const TopPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Welcome to",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset("assets/icons/cart.svg"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Plant Shop",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryGreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchPortion extends StatelessWidget {
  const SearchPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 35),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: AppColors.lightGray,
                filled: true,
                prefixIcon: IconButton(
                  onPressed: null,
                  icon: SvgPicture.asset("assets/icons/cart.svg"),
                ),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),

          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: null,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primaryGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: SvgPicture.asset("assets/icons/cart.svg")),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryTabState extends State<CategoryTab> {
  int selectedIndex = 0;
  final List<String> categories = [
    "POPULAR",
    "ORGANIC",
    "INDOORS",
    "SYNTHETIC",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 35),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categories.map((category) {
                int index = categories.indexOf(category);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: selectedIndex == index
                              ? AppColors.primaryGreen
                              : AppColors.textBlack,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.only(top: 5),
                        padding: EdgeInsets.symmetric(
                          horizontal: selectedIndex == index ? 26 : 0,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: selectedIndex == index
                              ? AppColors.primaryGreen
                              : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class GridPortion extends StatelessWidget {
  const GridPortion({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 1),
        child: GridView.builder(
          itemCount: 8,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 15,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return const PlantItemCard();
          },
        ),
      ),
    );
  }
}

class PlantItemCard extends StatelessWidget {
  static List<String> plant = List.generate(8, (index) => "Service $index");
  const PlantItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: null,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundGray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Image.asset("assets/images/plant_image.jpg")),
                  Text(
                    "11",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "123",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: AppColors.primaryGreen,
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: CircleAvatar(
                  backgroundColor: AppColors.backgroundGray,
                  child: Icon(Icons.favorite, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
