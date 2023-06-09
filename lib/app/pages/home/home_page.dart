import 'package:catalog/app/pages/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../categoria/categoria_page.dart';
import '../profile/profile_page.dart';

class HomePage extends StatelessWidget { 
  const HomePage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 110,
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                    Get.to(UserPage());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.person,
                          size: 45,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 110,
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(CategoriaPage());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.category,
                          size: 45,
                        ),
                        Text('Categoria',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}