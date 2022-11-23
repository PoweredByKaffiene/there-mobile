import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:there/widgets/layout/root.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

    return Root(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Text("Login", style: theme.textTheme.headline1?.copyWith(color: theme.primaryColor, fontWeight: FontWeight.bold), textAlign: TextAlign.start),
            SizedBox(height: 1.h),
            Text("Login to start sharing your location", style: theme.textTheme.subtitle1, textAlign: TextAlign.start),
            const Divider(),
            SizedBox(height: 6.h),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 1.h),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    width: 70.w,
                    height: 6.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Login"),
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}