import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mcqs_app/components/custom_animation_lottie.dart';

import '../controllers/jobs_controller.dart';

class JobsView extends GetView<JobsController> {
  const JobsView({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardInsets = MediaQuery.of(context).viewInsets.bottom;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset('assets/images/drwericon.png'),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        backgroundColor: const Color(0xff1852EB),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/homeprofileimage.png'),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff1852EB), Color(0xff4839D4)],
                ),
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.blue,
                  child: CustomLottieAnimation(
                    lottieFile: 'assets/images/qa.json',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset('assets/images/drawerhomeicon.svg'),
              title: const Text('Home'),
              onTap: () {
                if (Get.currentRoute == '/home') {
                  Get.back();
                } else {
                  Get.toNamed('/home');
                }
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/drawerpremiumicon.svg',
                height: 34,
                width: 35.42,
              ),
              title: const Text('Premium'),
              onTap: () {
                Get.toNamed('/premium');
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/drawersettingsicon.svg',
                height: 34,
                width: 35.42,
              ),
              title: const Text('Settings'),
              onTap: () {
                Get.toNamed('/profile');
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/drawerrateusicon.svg',
                height: 34,
                width: 35.42,
              ),
              title: const Text('Rate Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/drawershareicon.svg',
                height: 34,
                width: 35.42,
              ),
              title: const Text('Share Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                'assets/images/drawercontactusicon.svg',
                height: 34,
                width: 35.42,
              ),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff1852EB),
                  Color(0xff4839D4),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * .85 -
                  keyboardInsets, // Adjust height based on keyboard
              decoration: const BoxDecoration(
                color: Color(0xffF0F0F0),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(19.34),
                  topRight: Radius.circular(19.34),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Design',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.location_city,
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Rawalpindi Islamabad',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          FilterChipWidget(label: 'All', isSelected: false),
                          FilterChipWidget(label: 'Design', isSelected: false),
                          FilterChipWidget(
                              label: 'Development', isSelected: false),
                          FilterChipWidget(
                              label: 'Marketing', isSelected: false),
                          FilterChipWidget(label: 'Sales', isSelected: false),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: jobs.length,
                        itemBuilder: (context, index) {
                          final job = jobs[index];
                          return InkWell(
                            onTap: () {
                              // Handle container tap
                              Get.toNamed('/jobsdetails');
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.white,
                                    child: Image.asset(job.logo,
                                        fit: BoxFit.cover),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    job.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        job.company,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(width: 3),
                                      Text(
                                        job.location,
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 21),
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 80,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          color: Color(0xffCBC9D4),
                                        ),
                                        child: const Center(child: Text('Design')),
                                      ),
                                      const SizedBox(width: 4),
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          color: Color(0xffCBC9D4),
                                        ),
                                        height: 40,
                                        width: 80,
                                        child: const Center(child: Text('Full time')),
                                      ),
                                      const SizedBox(width: 4),
                                      Container(
                                        height: 40,
                                        width: 120,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          color: Color(0xffCBC9D4),
                                        ),
                                        child: const Center(
                                            child: Text('Senior Designer')),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 19),
                                  Text(
                                    job.timeAgo,
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool selected) {
          // Handle filter selection
        },
        selectedColor: Colors.blue,
        backgroundColor: const Color(0xffCBC9D4),
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : const Color(0xff524B6B),
        ),
        side: BorderSide.none,
      ),
    );
  }
}

class Job {
  final String title;
  final String company;
  final String location;
  final String timeAgo;
  final String logo;

  Job(this.title, this.company, this.location, this.timeAgo, this.logo);
}

final List<Job> jobs = [
  Job('UI UX Designer', 'Code Crush Technologies', 'Rawalpindi, Pakistan',
      '25 minutes ago', 'assets/images/cctlogo.png'),
  Job('Lead Designer', 'MK Techsol Company', 'Islamabad, Pakistan',
      '1 minute ago', 'assets/images/9dlogo.png'),
  Job('Software Developer', 'Arbisoft', 'Lahore, Pakistan', '1 hour ago',
      'assets/images/cctlogo.png'),
];
