import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/theme_provider.dart';

import '../my_theme.dart';
import '../theme_bottom_sheet.dart';

class SettingsTab extends StatelessWidget {
  static const String routeName = 'settings';

  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.mode == ThemeMode.light
          ? MyThemeData.scafoldColor
          : MyThemeData.darkColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Language",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: themeProvider.mode == ThemeMode.light
                        ? Theme.of(context).colorScheme.onSurface
                        : Theme.of(context).colorScheme.surface,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    "English",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Mode",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                color: themeProvider.mode == ThemeMode.light
                    ? Theme.of(context).colorScheme.onSurface
                    : Theme.of(context).colorScheme.surface,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showThemeSheet(context);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(
                    color: themeProvider.mode == ThemeMode.light
                        ? Colors.white
                        : Colors.white,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    themeProvider.mode == ThemeMode.light ? "Light" : "Dark",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
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

  void showThemeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeBottomSheet();
      },
    );
  }
}
