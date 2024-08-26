import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/theme_provider.dart';

import 'my_theme.dart';



class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Container(
      color: provider.mode == ThemeMode.light
          ? Colors.white
          : MyThemeData.darkColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Light",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: provider.mode == ThemeMode.light
                              ? Theme.of(context).colorScheme.primary
                              : Colors.white,
                        )),
                    Spacer(),
                    Icon(
                      Icons.done,
                      color: provider.mode == ThemeMode.light
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 3,
              endIndent: 50,
              indent: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Dark",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: provider.mode == ThemeMode.light
                                ? Colors.black54
                                : MyThemeData.lightColor)),
                    Spacer(),
                    Icon(
                      Icons.done,
                      color: provider.mode == ThemeMode.light
                          ? Colors.black54
                          : MyThemeData.lightColor,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}