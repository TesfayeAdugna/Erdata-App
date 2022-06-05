import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Footer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final whiteColor = Colors.white;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () async {
                  context.go('/about');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: whiteColor),
                    const SizedBox(width: 16),
                    Text(
                      "PHONE",
                      style: TextStyle(color: whiteColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  context.go('/about');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.telegram, color: whiteColor),
                    const SizedBox(width: 16),
                    Text(
                      "TELEGRAM",
                      style: TextStyle(color: whiteColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  context.go('/about');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook, color: whiteColor),
                    const SizedBox(width: 16),
                    Text(
                      "FACEBOOK",
                      style: TextStyle(color: whiteColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  context.go('/about');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera, color: whiteColor),
                    const SizedBox(width: 16),
                    Text(
                      "INSTAGRAM",
                      style: TextStyle(color: whiteColor),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  context.go('/about');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, color: whiteColor),
                    const SizedBox(width: 16),
                    Text(
                      "EMAIL",
                      style: TextStyle(color: whiteColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
