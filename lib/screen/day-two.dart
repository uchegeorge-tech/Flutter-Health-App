import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DayTwoScreen extends StatefulWidget {
  const DayTwoScreen({super.key});

  @override
  State<DayTwoScreen> createState() => _DayTwoScreenState();
}

class _DayTwoScreenState extends State<DayTwoScreen> {
  int selectedIndex = 0;

  static const List<String> activites = [
    'All task',
    'To do',
    'In Progress',
    'Done',
  ];

  final List<Map<String, dynamic>> tasks = [
    {
      "title": "Read poem & answer questions",
      "subject": "English Literature",
      "not-started": false,
      "date": "May 28th, 2025",
      "Comments": "12 Comments",
    },
    {
      "title": "Create a comic strip with a story",
      "subject": "Social Studies",
      "not-started": true,
      "date": "May 30th, 2025",
      "Comments": "2 Comments",
    },
    {
      "title": "Prepare for the math test",
      "subject": "Mathematics",
      "not-started": true,
      "date": "May 31st, 2025",
      "Comments": "12 Comments",
    },

        {
      "title": "Prepare for the Quiz",
      "subject": "Mathematics",
      "not-started": true,
      "date": "May 31st, 2025",
      "Comments": "12 Comments",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 238, 240),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My tasks',
                        style: TextStyle(
                          fontFamily: 'Jakara',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          _iconButton('assets/svg/search.svg'),
                          SizedBox(width: 10),
                          _iconButton('assets/svg/bell.svg'),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  SizedBox(
                    height: 40,
                    child: Row(
                      children: activites.asMap().entries.map((entry) {
                        int index = entry.key;
                        String activity = entry.value;
                        bool isSelected = index == selectedIndex;

                        return Expanded(
                          child: GestureDetector(
                            child: myWrapChip(
                              name: activity,
                              isSelected: isSelected,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  SizedBox(height: 26),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/filter.svg',
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Filters',
                            style: TextStyle(
                              fontFamily: 'Jakara',
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            'Sort by',
                            style: TextStyle(
                              fontFamily: 'Jakara',
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),

                  Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];

                        final String status = getStatus(task);
                        return Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: getColor(status),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  status,
                                  style: TextStyle(
                                    fontFamily: 'Jakara',
                                    fontSize: 10,
                                     color: getTextColor(status),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                task['title'],
                                style: TextStyle(
                                  fontFamily: 'Jakara',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                task['subject'],
                                style: TextStyle(
                                  fontFamily: 'Jakara',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  iconRow(
                                    icon: 'assets/svg/calender.svg',
                                    text: task['date'],
                                  ),
                                  iconRow(
                                    icon: 'assets/svg/chat.svg',
                                    text: task['Comments'],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: IntrinsicWidth(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildNavItem('assets/svg/pencil.svg'),
                        buildNavItem('assets/svg/calender.svg'),
                        buildNavItem('assets/svg/file.svg', isActive: true),
                        buildNavItem('assets/svg/user.svg'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildNavItem(String asset, {bool isActive = false}) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: isActive ? Colors.white : Colors.transparent,
      shape: BoxShape.circle,
    ),
    child: SvgPicture.asset(
      asset,
      color: isActive ? Colors.black : Colors.white,
    ),
  );
}

Widget _iconButton(asset) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    padding: EdgeInsets.all(7),
    width: 40,
    height: 40,
    child: SvgPicture.asset(
      asset,
      color: Colors.black,
      width: 20,
      height: 20,
      fit: BoxFit.contain,
    ),
  );
}

Widget myWrapChip({String? name, bool? isSelected}) {
  bool selected = isSelected ?? false;

  return Container(
    margin: EdgeInsets.only(right: 2),
    decoration: BoxDecoration(
      color: selected ? Colors.black : Colors.white,
      borderRadius: BorderRadius.circular(30),

      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Align(
      alignment: Alignment.center,
      child: Text(
        '$name',
        style: TextStyle(
          fontFamily: 'Jakara',
          fontSize: 13,
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

String getStatus(Map<String, dynamic> task) {
  return task['not-started'] == false ? 'In progress' : 'To do';
}

Color getColor(String status) {
  return status == 'In progress' ? Colors.amber : const Color.fromARGB(255, 143, 73, 213);
}

Color getTextColor(String status) {
  return status == 'In progress' ? Colors.black : Colors.white;
}

Widget iconRow({required String icon, required String text}) {
  return Row(
    children: [
      SvgPicture.asset(icon, color: Colors.black.withOpacity(0.4), width: 20),

      SizedBox(width: 5),

      Text(
        text,
        style: TextStyle(
          fontFamily: 'Jakara',
          fontSize: 13,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
