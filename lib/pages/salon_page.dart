import 'package:flutter/material.dart';

class SalonPage extends StatelessWidget {
  const SalonPage({super.key});

  static List<String> services = List.generate(8, (index) => "Service $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Test(),
            Container(
              padding: const EdgeInsets.only(left: 10, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flutter Salon App UI 연습",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text("Number 4 UI Test"),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/flower.jpg",
                          fit: BoxFit.cover,
                          scale: 3,
                        ),
                        SizedBox(width: 10),
                        Image.asset(
                          "assets/images/flower.jpg",
                          fit: BoxFit.cover,
                          scale: 3,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "what do you want to do?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 30,
                      runSpacing: 20,
                      children: services
                          .map(
                            (e) => Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xffE1F5FA),
                                  radius: 35,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  e,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amberAccent,
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  SizedBox(height: 10),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: services
                          .map(
                            (e) => Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.amber,
                                    child: CircleAvatar(
                                      radius: 38,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        "Featured Salon",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    trailing: TextButton(
                      onPressed: () {},
                      child: Text(
                        "View All",
                        style: TextStyle(color: Color(0xff156778)),
                      ),
                    ),
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            20,
                          ), // 깎고 싶은 만큼 수치 입력
                          child: Image.asset(
                            "assets/images/flower.jpg",
                            fit: BoxFit.cover,
                            width: 150, // 가로 스크롤 시 크기를 명시해주면 더 좋습니다
                            height: 150,
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            20,
                          ), // 깎고 싶은 만큼 수치 입력
                          child: Image.asset(
                            "assets/images/flower.jpg",
                            fit: BoxFit.cover,
                            width: 150, // 가로 스크롤 시 크기를 명시해주면 더 좋습니다
                            height: 150,
                          ),
                        ),
                        SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            20,
                          ), // 깎고 싶은 만큼 수치 입력
                          child: Image.asset(
                            "assets/images/flower.jpg",
                            fit: BoxFit.cover,
                            width: 150, // 가로 스크롤 시 크기를 명시해주면 더 좋습니다
                            height: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
