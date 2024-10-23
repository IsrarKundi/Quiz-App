import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Background Gradient
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff1852EB), Color(0xff4839D4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            // Profile Section with White Background
            Positioned(
              bottom:
                  0, // Adjust this value for the desired distance from the top
              left: 0,
              right: 0,
              child: Container(
                // padding: const EdgeInsets.symmetric(vertical: 10.0),
                height: screenHeight * .75,

                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // Stats Container (Ranks, Coins, Diamonds)
                      Container(
                        height: screenHeight * .2,
                        width: screenWidth * .85,
                        decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Ranks'),
                                  const SizedBox(
                                    width: 140,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: IconButton(
                                      icon: Image.asset(
                                          'assets/images/profilerank.png'),
                                      iconSize: 1, // You can adjust the size
                                      onPressed: () {
                                        // Your action here
                                      },
                                    ),
                                  ),
                                  const Text('01'),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Coins'),
                                  const SizedBox(
                                    width: 140,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: IconButton(
                                      icon: Image.asset(
                                          'assets/images/coins.png'),
                                      iconSize: 1, // You can adjust the size
                                      onPressed: () {
                                        // Your action here
                                      },
                                    ),
                                  ),
                                  const Text('250'),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Daimonds'),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: IconButton(
                                      icon: Image.asset(
                                          'assets/images/daimond.png'),
                                      iconSize: 1, // You can adjust the size
                                      onPressed: () {
                                        // Your action here
                                      },
                                    ),
                                  ),
                                  const Text('03'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password Change TextFormFields
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none, // No outline
                                ),
                                hintText: 'Change Password',
                                fillColor: Color(0xffFFFFFF),
                                filled: true,
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password.';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide.none, // No outline
                                ),
                                hintText: 'Confirm Password',
                                fillColor: Color(0xffFFFFFF),
                                filled: true,
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password.';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Rating and Share Section
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.blue),
                                SizedBox(width: 8),
                                Text('Rate us', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.share, color: Colors.blue),
                                SizedBox(width: 8),
                                Text('Share us',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Save Button
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xff1852EB), // Start color
                                  Color(0xff4839D4), // End color
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(
                                  31), // Same border radius as button
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle save button press
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 15),
                                backgroundColor: Colors
                                    .transparent, // Make button background transparent
                                shadowColor: Colors
                                    .transparent, // Remove shadow if necessary
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(31),
                                ),
                              ),
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 58,
                left: 100,
                right: 100,
                child: Container(
                  height: 197,
                  width: 133,
                  color: Colors.transparent,
                  // color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Profile', // Replace with dynamic name
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Stack(
                          children: [
                            const CircleAvatar(
                              radius: 55, // Adjust the radius as needed

                              backgroundImage: AssetImage(
                                  'assets/images/homeprofileimage.png'), // Placeholder image
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 40,
                                width: 40,
                                color: Colors.white,
                                child: IconButton(
                                  onPressed: () {
                                    // Handle camera icon press
                                  },
                                  icon: const Icon(Icons.camera_alt),
                                  color: const Color(0XFF4147DC),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Profile Name and Edit Icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'James', // Replace with dynamic name
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              alignment: AlignmentDirectional.topStart,
                              onPressed: () {
                                // Handle edit icon press
                              },
                              icon: const Icon(
                                Icons.edit,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Positioned(
                top: 10,
                child: SizedBox(
                  height: 40,
                  width: screenWidth * 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notification_add_rounded,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
