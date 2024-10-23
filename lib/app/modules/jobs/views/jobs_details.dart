import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mcqs_app/app/modules/jobs/controllers/jobs_controller.dart';
import 'package:mcqs_app/components/custom_animation_lottie.dart';

class JobsDetails extends StatefulWidget {
  const JobsDetails({super.key});

  @override
  State<JobsDetails> createState() => _JobsDetailsState();
}

class _JobsDetailsState extends State<JobsDetails> {
  final JobsController jobsController = Get.put(JobsController());
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height * 1;
    double screenwidth = MediaQuery.of(context).size.width * 1;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Image.asset(
                  'assets/images/drwericon.png'), // Your custom image
              onPressed: () {
                Scaffold.of(context)
                    .openDrawer(); // Opens the drawer when the icon is pressed
              },
            ),
          ),
          backgroundColor: const Color(0xff1852EB),
          actions: [
            // Profile Image aligned to the right side of AppBar
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: InkWell(
                onTap: () {
                  Get.toNamed('/profile');
                },
                child: const CircleAvatar(
                  radius: 20, // Adjust size as needed

                  backgroundImage: AssetImage(
                      'assets/images/homeprofileimage.png'), // Replace with your image URL
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.6, // 60% of screen width
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff1852EB), Color(0xff4839D4)])),
                  child: Center(
                    child: CircleAvatar(
                      radius: 55,

                      // Adjust the size of the circle
                      // backgroundImage: AssetImage(
                      //     'assets/images/facebookicon.jpg'), // Your image asset
                      backgroundColor: Colors.blue,
                      child: CustomLottieAnimation(
                        lottieFile: 'assets/images/qa.json',
                        fit: BoxFit.cover,
                      ), // Optional: background color if image doesn't cover the circle
                    ),
                  )),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/images/drawerhomeicon.svg',
                  // color: Colors.blue,
                ),
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
                title: const Text('Permium'),
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
                  Navigator.pop(context); // Closes the drawer
                  // Navigate to Settings Screen or perform other actions
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
                  Navigator.pop(context); // Closes the drawer
                  // Navigate to Settings Screen or perform other actions
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
                  Navigator.pop(context); // Closes the drawer
                  // Navigate to Contact Screen or perform other actions
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
                height: screenHeight * .85,
                decoration: const BoxDecoration(
                  color: Color(0xffF0F0F0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(19.34),
                    topRight: Radius.circular(19.34),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const Text(
                        //   'UI UX Design',
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 16,
                        //   ),
                        // ),
                        // const SizedBox(height: 4),
                        // const Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       'Code Crush',
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 14,
                        //       ),
                        //     ),
                        //     SizedBox(width: 8),
                        //     Text('Rawalpindi'),
                        //     SizedBox(width: 8),
                        //     Text(
                        //       '1 day ago',
                        //       style: TextStyle(
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 14,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(height: 4),

                        // Row with two buttons
                        Obx(() => Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          jobsController.updateIndex(
                                              0); // Update to Description
                                        },
                                        style: ElevatedButton.styleFrom(
                                          side: BorderSide.none, // No border
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                6), // Border radius
                                          ),
                                          foregroundColor: Colors.white,
                                          backgroundColor: jobsController
                                                      .selectedIndex.value ==
                                                  0
                                              ? const Color(
                                                  0xff1852EB) // Blue when selected
                                              : const Color(
                                                  0xffFFFFFF), // White when not selected
                                        ),
                                        child: Text(
                                          'Description',
                                          style: TextStyle(
                                            color: jobsController
                                                        .selectedIndex.value ==
                                                    0
                                                ? Colors.white
                                                : Colors
                                                    .black, // White text when selected, black otherwise
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {
                                          jobsController.updateIndex(
                                              1); // Update to Company Details
                                        },
                                        style: OutlinedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                6), // Border radius
                                          ),
                                          side: BorderSide.none,
                                          backgroundColor: jobsController
                                                      .selectedIndex.value ==
                                                  1
                                              ? const Color(
                                                  0xff1852EB) // Blue when selected
                                              : const Color(
                                                  0xffFFFFFF), // White when not selected
                                        ),
                                        child: Text(
                                          'Company Details',
                                          style: TextStyle(
                                            color: jobsController
                                                        .selectedIndex.value ==
                                                    1
                                                ? Colors.white
                                                : Colors
                                                    .black, // White text when selected, black otherwise
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),

                        const SizedBox(height: 8),
                        //Company Details Section
                        Obx(() {
                          return jobsController.selectedIndex == 1
                              ? const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'About Company',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas .',
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain.',
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Website',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Text(
                                      'www.codecrush.com',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Industry',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Text('Software Development'),
                                    SizedBox(height: 4),
                                    Text(
                                      'Employee Size',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Text('50-200 employees'),
                                    SizedBox(height: 4),
                                    Text(
                                      'Head Office',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Text('Rawalpindi, Pakistan'),
                                    SizedBox(height: 4),
                                    Text(
                                      'Type',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Text('Multinational Company'),
                                  ],
                                )
                              : Container();
                        }),

                        // Jobs  Details Section
                        Obx(() {
                          return jobsController.selectedIndex == 0
                              ? Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: screenheight * .09,
                                        width: screenwidth * 1,
                                        // color: Colors.amber,
                                        child: const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Container(
                                            //   height: screenheight * 0.10,
                                            //   width: screenwidth * 0.28,
                                            //   // color: Colors.blue,
                                            //   child: Image.asset(
                                            //     'assets/images/cctlogo.png',
                                            //   ),
                                            // ),
                                            // const SizedBox(
                                            //   height: 24,
                                            // ),
                                            Text(
                                              'UI/UX Designer',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Code Crush',
                                                  style: TextStyle(
                                                      color: Color(0XFF7E7E7E),
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  'Rawalpindi',
                                                  style: TextStyle(
                                                      color: Color(0XFF7E7E7E),
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  '1 day ago',
                                                  style: TextStyle(
                                                      color: Color(0XFF7E7E7E),
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Salary',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 4,
                                            // ),
                                            Text(
                                              'Job Type',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 4,
                                            // ),
                                            Text(
                                              'Position',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Job Description',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem ...',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {},
                                                child: const Text('Read more')),
                                            const Text(
                                              'Requirements',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              '.Sed ut perspiciatis unde omnis iste natus error sit.',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              '. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur & adipisci velit.',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              '.Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              '.Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            const Text(
                                              'Location',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              ". Al-Nawaz Arcade, Adjacent to Rawalpindi Urology Hospital, Murree Road, Rawalpindi.",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              height: screenheight * .22,
                                              width: screenwidth * 1,
                                              color: Colors.green,
                                              child: Image.asset(
                                                'assets/images/mapimage.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Information',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Position',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Text(
                                              "Senior Designer",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            Container(
                                              width: screenwidth * 1,
                                              color: const Color(0xffDEE1E7)
                                                  .withOpacity(0.5),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Qualification',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Text(
                                              "Bachlor Degree",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Experience',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Text(
                                              "3 Years",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Job Type',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Text(
                                              "Full Time",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Specialization',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Text(
                                              "Design",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Facilities and Others',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Text(
                                              ".Medical",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const Text(
                                              ".Dental",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const Text(
                                              ".Technical Certification",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const Text(
                                              ".Medical Allowance",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const Text(
                                              ".Transport Allowance",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const Text(
                                              ".Regulars-Hours",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                            const Text(
                                              ".Monday-Friday",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff524B6B),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Container();
                        })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
