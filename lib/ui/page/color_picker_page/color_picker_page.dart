import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wan_android_flutter/provider/provider.dart';
import 'package:wan_android_flutter/res/res.dart';
import 'package:wan_android_flutter/utils/utils.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  late ValueNotifier<Color> notifier;

  @override
  void initState() {
    final color = SpUtil.getThemeColor() ?? Colors.lightBlueAccent;
    notifier = ValueNotifier(color);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: notifier,
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: value,
            leading: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              onTap: () => Navigate.pop(),
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
            title: Text(
              StringStyles.settingThemeColors.tr,
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            children: <Widget>[
              const SizedBox(height: 16),

              // Show the color picker in sized box in a raised card.
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Card(
                    elevation: 2,
                    child: ColorPicker(
                      // Use the screenPickerColor as color.
                      color: value,
                      // Update the screenPickerColor using the callback.
                      onColorChanged: (Color color) {
                        notifier.value = color;
                        Provider.of<ThemeColorsNotifier>(
                          context,
                          listen: false,
                        ).setColor(color);
                      },
                      width: 44,
                      height: 44,
                      borderRadius: 22,
                      heading: Text(
                        'Select color',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      subheading: Text(
                        'Select color shade',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
