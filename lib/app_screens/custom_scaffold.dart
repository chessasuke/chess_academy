import 'package:chess_academy/navigator/page_manager.dart';
import 'package:chess_academy/theme/adabtableFontSize.dart';
import 'package:chess_academy/theme/responsive.dart';
import 'package:chess_academy/theme/theme_toggle.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../utils.dart';
import 'custom_appbar.dart';
import 'widgets.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({Key? key, this.content}) : super(key: key);

  final Widget? content;

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerSlideController;

  @override
  void initState() {
    super.initState();

    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0;
  }

  bool _isDrawerOpening() {
    return _drawerSlideController.status == AnimationStatus.forward;
  }

  bool _isDrawerClosed() {
    return _drawerSlideController.value == 0.0;
  }

  void _toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _drawerSlideController.reverse();
    } else {
      _drawerSlideController.forward();
    }
  }

  PreferredSizeWidget _buildAppBar() {
    return ResponsiveWidget.isMobileScreen(context)
        ? AppBar(
            title: Text(
              'Smart Chess',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            actions: [
              AnimatedBuilder(
                animation: _drawerSlideController,
                builder: (context, child) {
                  return IconButton(
                    onPressed: _toggleDrawer,
                    icon: _isDrawerOpen() || _isDrawerOpening()
                        ? const Icon(
                            Icons.clear,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                  );
                },
              ),
            ],
          )
        : AppBar(
            iconTheme: IconThemeData(
                color: Theme.of(context).colorScheme.onBackground),
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            elevation: 0,
            leadingWidth: 500,
            title: InkWell(
              onTap: () => PageManager.of(context).resetToHome(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Text(
                  'LOGO HERE',
                  style: FlexTextStyle.getStyle(context).bodyText1!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              ),
            ),
            actions: [
              if (!ResponsiveWidget.isMobileScreen(context))
                for (final item in menuItems)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                    child: MenuItem(
                        text: item,
                        onTap: Utils.getMenuOnTapFunction(item, context)),
                  ),
              const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: ToggleBrightness(),
              )
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          if (widget.content != null) widget.content!,
          if (ResponsiveWidget.isMobileScreen(context)) _buildDrawer(),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
      animation: _drawerSlideController,
      builder: (context, child) {
        return FractionalTranslation(
          translation: Offset(1.0 - _drawerSlideController.value, 0.0),
          child: _isDrawerClosed() ? const SizedBox() : Menu(),
        );
      },
    );
  }
}
