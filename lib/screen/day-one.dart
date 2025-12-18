import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/constants/colors.dart';
import 'package:myapp/layout/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> categories = [
    {"title": "Emotional Balance", "isActive": true, "duration": "15 mins"},
    {"title": "Calm Relaxation", "isActive": false, "duration": "12 mins"},
  ];

  final List<Map<String, dynamic>> special_categories = [
    {
      "title": "Morning Gratitude",
      "duration": "5 mins",
      "timeOfDay": "Morning",
      "isPrimary": true,
    },

    {
      "title": "Serinity Before Sleep",
      "duration": "10 mins",
      "timeOfDay": "Evening",
      "isPrimary": false,
    },

    {
      "title": "Peace and Calm",
      "duration": "12 mins",
      "timeOfDay": "Evening",
      "isPrimary": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                children: [
                  buildGreetingSection(),
                  SizedBox(height: 40),
                  buildSearchBar(),
                  SizedBox(height: 20),
                  buildCategoryGrid(categories),
                ],
              ),
            ),

            Expanded(child: SpecialForYouSection(special_categories)),
          ],
        ),
      ),

     bottomNavigationBar: CustomNavBar.bar(context: context, currentIndex: currentIndex, onTap: (i) => setState(() {
       currentIndex = i;
     })),
    );
  }
}

Widget buildGreetingSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Hello Paul',
        style: TextStyle(
          fontFamily: 'Jakara',
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),

      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: SvgPicture.asset('assets/svg/bell.svg'),
        ),
      ),
    ],
  );
}

Widget buildSearchBar() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: Offset(0, 2),
          blurRadius: 10,
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search...',
        contentPadding: EdgeInsets.symmetric(vertical: 14),
        hintStyle: TextStyle(
          fontFamily: 'Jakara',
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.5),
        ),
        prefixIcon: Padding(
          padding: EdgeInsetsGeometry.all(12),
          child: SvgPicture.asset(
            'assets/svg/search.svg',
            width: 18,
            height: 18,
          ),
        ),
      ),
    ),
  );
}

Widget buildCategoryGrid(List<Map<String, dynamic>> items) {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      childAspectRatio: 1,
    ),
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return buildCategoryCard(
        title: item['title'] as String,
        isActive: item['isActive'] as bool,
        duration: item['duration'] as String,
      );
    },
  );
}

Widget buildCategoryCard({
  required String title,
  required bool isActive,
  required String duration,
}) {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: isActive ? Colors.black : Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: Offset(0, 2),
          blurRadius: 10,
        ),
      ],
    ),

    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontSize: 18,
                fontFamily: 'Jakara',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,

          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: isActive ? Colors.grey[800] : Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 12,
                  top: 12,
                  child: Text(
                    duration,
                    style: TextStyle(
                      fontFamily: 'Jakara',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: isActive ? Colors.white : Colors.black,
                    ),
                  ),
                ),

                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColor.ligthblue,
                      shape: BoxShape.circle,
                    ),

                    child: Icon(Icons.play_arrow_rounded),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget SpecialForYouSection(List<Map<String, dynamic>> items) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 12,
          offset: Offset(0, 4),
        ),
      ],
    ),
    margin: EdgeInsets.symmetric(horizontal: 20),
    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Special for you',
              style: TextStyle(
                fontFamily: 'Jakara',
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            Row(
              children: [
                Text(
                  'See all',
                  style: TextStyle(
                    fontFamily: 'Jakara',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(width: 5),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.keyboard_arrow_right_rounded, size: 16),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: 20),

        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Padding(
                padding: EdgeInsetsGeometry.only(bottom: 16),
                child: specialCard(
                  title: item['title'] as String,
                  duration: item['duration'] as String,
                  timeOfDay: item['timeOfDay'] as String,
                  isPrimary: item['isPrimary'] as bool,
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget specialCard({
  required String title,
  required String duration,
  required String timeOfDay,
  required bool isPrimary,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
    decoration: BoxDecoration(
      color: isPrimary ? AppColor.ligthblue.withOpacity(0.7) : Colors.white,
      border: Border.all(color: Colors.grey.withOpacity(0.4)),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontFamily: 'Jakara',
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: 11),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                myChip(duration, isPrimary ? Colors.white : AppColor.ligthblue),
                SizedBox(width: 10),
                myChip(
                  timeOfDay,
                  isPrimary
                      ? Colors.white.withOpacity(0.5)
                      : AppColor.ligthblue.withOpacity(0.2),
                ),
              ],
            ),

            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isPrimary ? Colors.white : AppColor.ligthblue,
                shape: BoxShape.circle,
              ),

              child: Icon(Icons.play_arrow_rounded),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget myChip(String label, Color bg) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(15),
    ),

    child: Text(
      label,
      style: TextStyle(
        fontSize: 10,
        fontFamily: 'Jakara',
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
